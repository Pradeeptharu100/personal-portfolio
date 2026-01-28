import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/home_screen.dart';
import '../terminal/terminal_screen.dart';

class AppRoutes {
  AppRoutes._();

  // Route names
  static const String home = '/';
  static const String terminal = '/terminal';

  // Route paths
  static const String homePath = '/';
  static const String terminalPath = '/terminal';

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: [
      GoRoute(
        path: homePath,
        name: home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: terminalPath,
        name: terminal,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TerminalScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
    ],
    errorBuilder: (context, state) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
