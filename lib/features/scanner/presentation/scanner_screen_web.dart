import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui_web' as ui_web;

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/glass_card.dart';
import '../data/scanner_service_web.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
  html.VideoElement? _videoElement;
  html.MediaStream? _stream;
  bool _isInitialized = false;
  bool _isScanning = false;
  final String _viewId = 'camera-view-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      _videoElement = html.VideoElement()
        ..autoplay = true
        ..muted = true
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.objectFit = 'cover';

      ui_web.platformViewRegistry.registerViewFactory(
        _viewId,
        (int viewId) => _videoElement!,
      );

      _stream = await html.window.navigator.mediaDevices?.getUserMedia({
        'video': {'facingMode': 'environment'},
        'audio': false,
      });

      _videoElement!.srcObject = _stream;
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      debugPrint('Camera init error: $e');
    }
  }

  @override
  void dispose() {
    _stream?.getTracks().forEach((t) => t.stop());
    super.dispose();
  }

  Future<void> _onScanPressed() async {
    if (_isScanning || _videoElement == null) return;
    setState(() => _isScanning = true);

    try {
      final canvas = html.CanvasElement(
        width: _videoElement!.videoWidth,
        height: _videoElement!.videoHeight,
      );
      canvas.context2D.drawImage(_videoElement!, 0, 0);

      final blob = await canvas.toBlob('image/jpeg', 0.85);
      final reader = html.FileReader();
      reader.readAsArrayBuffer(blob);
      await reader.onLoad.first;

      final bytes = (reader.result as Uint8List).toList();
      final service = ref.read(scannerServiceProvider);
      final result = await service.scanBytes(bytes);

      if (mounted && result != null) {
        context.push('/card/${result.id}');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Karte nicht erkannt. Bitte erneut versuchen.'),
            backgroundColor: AppColors.surfaceHighlight,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isScanning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Camera Preview
          if (_isInitialized)
            Positioned.fill(
              child: HtmlElementView(viewType: _viewId),
            )
          else
            Container(
              color: AppColors.background,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),

          // Dark overlay with card cutout
          Positioned.fill(child: _ScanOverlay()),

          // Top bar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  const Text(
                    'PokéScan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const Spacer(),
                  GlassIconButton(
                    icon: Icons.flash_off_rounded,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2),

          // Hint
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 120),
                Text(
                  'Karte in den Rahmen legen',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Bottom panel
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomScanPanel(
              isScanning: _isScanning,
              onScan: _onScanPressed,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScanOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OverlayPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.55);
    final cardW = size.width * 0.72;
    final cardH = cardW * (3.5 / 2.5);
    final left = (size.width - cardW) / 2;
    final top = (size.height - cardH) / 2 - 40;

    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, cardW, cardH),
      const Radius.circular(16),
    );

    final overlayPath = Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()..addRRect(cardRect),
    );
    canvas.drawPath(overlayPath, paint);

    final cornerPaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLen = 24.0;
    final r = cardRect.blRadiusX;
    final corners = [
      [Offset(left + r, top), Offset(left + r + cornerLen, top)],
      [Offset(left, top + r), Offset(left, top + r + cornerLen)],
      [Offset(left + cardW - r, top), Offset(left + cardW - r - cornerLen, top)],
      [Offset(left + cardW, top + r), Offset(left + cardW, top + r + cornerLen)],
      [Offset(left + r, top + cardH), Offset(left + r + cornerLen, top + cardH)],
      [Offset(left, top + cardH - r), Offset(left, top + cardH - r - cornerLen)],
      [Offset(left + cardW - r, top + cardH), Offset(left + cardW - r - cornerLen, top + cardH)],
      [Offset(left + cardW, top + cardH - r), Offset(left + cardW, top + cardH - r - cornerLen)],
    ];
    for (final line in corners) {
      canvas.drawLine(line[0], line[1], cornerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BottomScanPanel extends StatelessWidget {
  final bool isScanning;
  final VoidCallback onScan;

  const _BottomScanPanel({required this.isScanning, required this.onScan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            AppColors.background,
            AppColors.background.withOpacity(0.95),
            AppColors.background.withOpacity(0),
          ],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: isScanning ? null : onScan,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isScanning ? AppColors.surfaceElevated : AppColors.primary,
                boxShadow: isScanning ? [] : [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.4),
                    blurRadius: 24,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: isScanning
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(strokeWidth: 2.5, color: AppColors.primary),
                    )
                  : const Icon(Icons.document_scanner_rounded, color: Colors.white, size: 30),
            ),
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(begin: 1.0, end: 1.04, duration: 1800.ms, curve: Curves.easeInOut),
          const SizedBox(height: 12),
          Text(
            isScanning ? 'Wird erkannt...' : 'Tippe zum Scannen',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.3);
  }
}
