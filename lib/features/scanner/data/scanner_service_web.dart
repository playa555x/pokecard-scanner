import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../../shared/models/pokemon_card.dart';
import '../../../shared/providers/card_provider.dart';

final scannerServiceProvider = Provider<ScannerService>((ref) {
  final dio = ref.watch(dioProvider);
  return ScannerService(dio);
});

class ScannerService {
  final Dio _dio;

  ScannerService(this._dio);

  Future<PokemonCard?> scanCard(String imagePath) async {
    return await _tryOcrMatch(imagePath);
  }

  Future<PokemonCard?> scanBytes(List<int> bytes) async {
    try {
      final formData = FormData.fromMap({
        'image': MultipartFile.fromBytes(bytes, filename: 'card.jpg'),
      });

      final response = await _dio.post(
        '/api/scan/phash',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      if (response.statusCode == 200 && response.data['confidence'] > 0.6) {
        return PokemonCard.fromJson(response.data['card'] as Map<String, dynamic>);
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<PokemonCard?> _tryOcrMatch(String imagePath) async {
    return null;
  }

  void dispose() {}
}
