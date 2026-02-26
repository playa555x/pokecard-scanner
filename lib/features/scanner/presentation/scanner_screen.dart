import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/glass_card.dart';
import '../data/scanner_service.dart';
import '../domain/scan_state.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen>
    with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isInitialized = false;
  bool _isScanning = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) return;

    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    await _controller!.initialize();
    if (mounted) {
      setState(() => _isInitialized = true);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _onScanPressed() async {
    if (_isScanning || _controller == null) return;
    setState(() => _isScanning = true);

    try {
      final image = await _controller!.takePicture();
      final service = ref.read(scannerServiceProvider);
      final result = await service.scanCard(image.path);

      if (mounted && result != null) {
        context.push('/card/${result.id}');
      } else if (mounted) {
        _showNotFound();
      }
    } finally {
      if (mounted) setState(() => _isScanning = false);
    }
  }

  void _showNotFound() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Karte nicht erkannt. Bitte erneut versuchen.'),
        backgroundColor: AppColors.surfaceHighlight,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Camera Preview
          if (_isInitialized && _controller != null)
            Positioned.fill(
              child: CameraPreview(_controller!),
            )
          else
            Container(color: AppColors.background),

          // Dark overlay outside scan area
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
                    icon: Icons.photo_library_rounded,
                    onTap: () {/* gallery picker */},
                  ),
                  const SizedBox(width: 8),
                  GlassIconButton(
                    icon: Icons.flash_off_rounded,
                    onTap: () {/* toggle flash */},
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.2),

          // Center scan hint
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

    // Card aspect ratio ~2.5 x 3.5 inches → 5:7
    final cardW = size.width * 0.72;
    final cardH = cardW * (3.5 / 2.5);
    final left = (size.width - cardW) / 2;
    final top = (size.height - cardH) / 2 - 40;

    final cardRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, cardW, cardH),
      const Radius.circular(16),
    );

    // Fill everything except card area
    final fullPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final holePath = Path()..addRRect(cardRect);
    final overlayPath = Path.combine(PathOperation.difference, fullPath, holePath);
    canvas.drawPath(overlayPath, paint);

    // Corner brackets
    final cornerPaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const cornerLen = 24.0;
    final r = cardRect.blRadiusX;

    final corners = [
      // Top-left
      [Offset(left + r, top), Offset(left + r + cornerLen, top)],
      [Offset(left, top + r), Offset(left, top + r + cornerLen)],
      // Top-right
      [Offset(left + cardW - r, top), Offset(left + cardW - r - cornerLen, top)],
      [Offset(left + cardW, top + r), Offset(left + cardW, top + r + cornerLen)],
      // Bottom-left
      [Offset(left + r, top + cardH), Offset(left + r + cornerLen, top + cardH)],
      [Offset(left, top + cardH - r), Offset(left, top + cardH - r - cornerLen)],
      // Bottom-right
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

  const _BottomScanPanel({
    required this.isScanning,
    required this.onScan,
  });

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
          // Scan Button
          GestureDetector(
            onTap: isScanning ? null : onScan,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isScanning ? AppColors.surfaceElevated : AppColors.primary,
                boxShadow: isScanning
                    ? []
                    : [
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
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.primary,
                      ),
                    )
                  : const Icon(
                      Icons.document_scanner_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
            ),
          )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scaleXY(
                begin: 1.0,
                end: 1.04,
                duration: 1800.ms,
                curve: Curves.easeInOut,
              ),
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
