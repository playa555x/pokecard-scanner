import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../shared/models/pokemon_card.dart';
import '../../../shared/providers/card_provider.dart';

final scannerServiceProvider = Provider<ScannerService>((ref) {
  final dio = ref.watch(dioProvider);
  return ScannerService(dio);
});

class ScannerService {
  final Dio _dio;
  final TextRecognizer _textRecognizer = TextRecognizer();

  ScannerService(this._dio);

  /// Main scan entry point
  /// 1. Try pHash matching via backend
  /// 2. Fallback: OCR to extract card name, then search
  Future<PokemonCard?> scanCard(String imagePath) async {
    final file = File(imagePath);
    final bytes = await file.readAsBytes();

    // Step 1: pHash via backend
    final pHashResult = await _tryPHashMatch(bytes);
    if (pHashResult != null) return pHashResult;

    // Step 2: OCR fallback
    return await _tryOcrMatch(imagePath);
  }

  Future<PokemonCard?> _tryPHashMatch(Uint8List imageBytes) async {
    try {
      // Preprocess: resize to 300x420 for consistent hashing
      final decoded = img.decodeImage(imageBytes);
      if (decoded == null) return null;

      final resized = img.copyResize(decoded, width: 300, height: 420);
      final processedBytes = img.encodeJpg(resized, quality: 85);

      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(
          processedBytes,
          filename: 'card.jpg',
        ),
      });

      final response = await _dio.post(
        '/api/scan/phash',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200 && response.data['confidence'] > 0.8) {
        return PokemonCard.fromJson(
            response.data['card'] as Map<String, dynamic>);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<PokemonCard?> _tryOcrMatch(String imagePath) async {
    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final recognized = await _textRecognizer.processImage(inputImage);

      // Extract card name from recognized text blocks
      // Pokemon card name is typically the largest text at the top
      final lines = recognized.blocks
          .expand((b) => b.lines)
          .map((l) => l.text.trim())
          .where((t) => t.length > 2 && t.length < 40)
          .toList();

      if (lines.isEmpty) return null;

      // Try each line as a potential card name (top lines first)
      for (final line in lines.take(5)) {
        final response = await _dio.get(
          '/api/cards/search',
          queryParameters: {'q': line, 'limit': 1},
        );

        if (response.statusCode == 200) {
          final list = response.data as List;
          if (list.isNotEmpty) {
            return PokemonCard.fromJson(list.first as Map<String, dynamic>);
          }
        }
      }

      return null;
    } catch (_) {
      return null;
    }
  }

  void dispose() {
    _textRecognizer.close();
  }
}
