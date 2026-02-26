import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../features/scanner/presentation/scanner_screen.dart'
    if (dart.library.html) '../../features/scanner/presentation/scanner_screen_web.dart';
import '../../features/card_detail/presentation/card_detail_screen.dart';
import '../../features/collection/presentation/collection_screen.dart';
import '../../features/market/presentation/market_screen.dart';
import '../../shared/widgets/main_shell.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/scanner',
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/scanner',
            builder: (context, state) => const ScannerScreen(),
          ),
          GoRoute(
            path: '/collection',
            builder: (context, state) => const CollectionScreen(),
          ),
          GoRoute(
            path: '/market',
            builder: (context, state) => const MarketScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/card/:id',
        builder: (context, state) => CardDetailScreen(
          cardId: state.pathParameters['id']!,
        ),
      ),
    ],
  );
});
