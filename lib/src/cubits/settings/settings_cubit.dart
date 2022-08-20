import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  static const String _musicOnKey = 'music_on';
  static const String _soundOnKey = 'sound_on';

  void toggleMusic() {
    emit(state.copyWith(isMusicOn: !state.isMusicOn));
    _store();
  }

  void toggleSound() {
    emit(state.copyWith(isSoundOn: !state.isSoundOn));
    _store();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    emit(
      state.copyWith(
        isMusicOn: prefs.getBool(_musicOnKey) ?? state.isMusicOn,
        isSoundOn: prefs.getBool(_soundOnKey) ?? state.isSoundOn,
      ),
    );
  }

  Future<void> _store() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_musicOnKey, state.isMusicOn);
    prefs.setBool(_soundOnKey, state.isSoundOn);
  }
}
