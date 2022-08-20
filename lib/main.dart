import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'game_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive)
  ]);
  runApp(const GameApp());
}
