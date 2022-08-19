import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'src/configuration/configuration.dart';
import 'utils/game_router.dart';

class BitSwap extends StatelessWidget {
  const BitSwap({
    super.key,
  });

  static final GameRouter _gameRouter = GameRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      onGenerateTitle: (context) => L10n.of(context).gameName,
      debugShowCheckedModeBanner: false,
      theme: buildGameTheme(),
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.delegate.supportedLocales,
      routeInformationParser: _gameRouter.router.routeInformationParser,
      routeInformationProvider: _gameRouter.router.routeInformationProvider,
      routerDelegate: _gameRouter.router.routerDelegate,
    );
  }
}
