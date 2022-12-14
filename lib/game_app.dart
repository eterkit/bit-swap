import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'src/configuration/configuration.dart';
import 'src/cubits/score/score_cubit.dart';
import 'src/cubits/settings/settings_cubit.dart';
import 'utils/game_router.dart';

class GameApp extends StatelessWidget {
  const GameApp({
    super.key,
  });

  static final GameRouter _gameRouter = GameRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit()..load(),
        ),
        BlocProvider<ScoreCubit>(
          create: (context) => ScoreCubit()..load(),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
