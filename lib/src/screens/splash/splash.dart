import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/game_router.dart';
import '../../configuration/configuration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _initialize(context),
    );
  }

  @override
  Widget build(BuildContext context) => const Scaffold();

  Future<void> _initialize(BuildContext context) async {
    await _preloadAssets(context);
    context.replaceNamed(MenuScreenRoute.name);
  }

  Future<void> _preloadAssets(BuildContext context) {
    const items = GameIcons.iconsToPreload;

    final futures = items.map<Future<void>>(
      (asset) => precacheImage(AssetImage(asset), context),
    );
    return Future.wait(futures);
  }
}
