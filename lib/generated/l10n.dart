// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `Bit Swap`
  String get gameName {
    return Intl.message(
      'Bit Swap',
      name: 'gameName',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get generalLoading {
    return Intl.message(
      'Loading...',
      name: 'generalLoading',
      desc: '',
      args: [],
    );
  }

  /// `Bit\nSwap`
  String get mainMenuGameTitle {
    return Intl.message(
      'Bit\nSwap',
      name: 'mainMenuGameTitle',
      desc: '',
      args: [],
    );
  }

  /// `PLAY`
  String get mainMenuPlay {
    return Intl.message(
      'PLAY',
      name: 'mainMenuPlay',
      desc: '',
      args: [],
    );
  }

  /// `Tap or press space to move character`
  String get mainMenuPlayInstructions {
    return Intl.message(
      'Tap or press space to move character',
      name: 'mainMenuPlayInstructions',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsMenuTitle {
    return Intl.message(
      'Settings',
      name: 'settingsMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get settingsSound {
    return Intl.message(
      'Sound',
      name: 'settingsSound',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get settingsMusic {
    return Intl.message(
      'Music',
      name: 'settingsMusic',
      desc: '',
      args: [],
    );
  }

  /// `Credits`
  String get settingsMenuCredits {
    return Intl.message(
      'Credits',
      name: 'settingsMenuCredits',
      desc: '',
      args: [],
    );
  }

  /// `Authors`
  String get creditsAuthors {
    return Intl.message(
      'Authors',
      name: 'creditsAuthors',
      desc: '',
      args: [],
    );
  }

  /// `Graphics`
  String get creditsGraphics {
    return Intl.message(
      'Graphics',
      name: 'creditsGraphics',
      desc: '',
      args: [],
    );
  }

  /// `Fonts`
  String get creditsFonts {
    return Intl.message(
      'Fonts',
      name: 'creditsFonts',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get creditsMusic {
    return Intl.message(
      'Music',
      name: 'creditsMusic',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get creditsSound {
    return Intl.message(
      'Sound',
      name: 'creditsSound',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pauseMenuTitle {
    return Intl.message(
      'Pause',
      name: 'pauseMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Game over`
  String get gameOverMenuTitle {
    return Intl.message(
      'Game over',
      name: 'gameOverMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get gameOverMenuScore {
    return Intl.message(
      'Score',
      name: 'gameOverMenuScore',
      desc: '',
      args: [],
    );
  }

  /// `High score`
  String get gameOverMenuHighScore {
    return Intl.message(
      'High score',
      name: 'gameOverMenuHighScore',
      desc: '',
      args: [],
    );
  }

  /// `New high score`
  String get gameOverMenuNewHighScore {
    return Intl.message(
      'New high score',
      name: 'gameOverMenuNewHighScore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
