import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../src/screens/game/game.dart';
import '../src/screens/menu/menu.dart';
import '../src/screens/settings/settings.dart';
import '../src/screens/splash/splash.dart';

class GameRouter {
  GameRouter() : router = _router;

  static final _router = GoRouter(
    initialLocation: '/${SplashScreenRoute.name}',
    routes: [
      GoRoute(
        path: '/splash',
        name: SplashScreenRoute.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/menu',
        name: MenuScreenRoute.name,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: const MenuScreen(),
        ),
        routes: [
          GoRoute(
            path: 'settings',
            name: SettingsScreenRoute.name,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: SettingsScreen(),
            ),
          ),
          GoRoute(
            path: 'game',
            name: GameScreenRoute.name,
            pageBuilder: (context, state) => CustomTransitionPage(
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: const GameScreen(),
            ),
          ),
        ],
      ),
    ],
  );

  final GoRouter router;
}

abstract class SplashScreenRoute {
  static const name = 'splash';
}

abstract class MenuScreenRoute {
  static const name = 'menu';
}

abstract class SettingsScreenRoute {
  static const name = 'settings';
}

abstract class GameScreenRoute {
  static const name = 'game';
}
