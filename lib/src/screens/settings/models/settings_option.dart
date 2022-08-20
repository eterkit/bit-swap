import '../../../../../generated/l10n.dart';
import '../../../configuration/configuration.dart';

enum SettingsOption { sound, music }

extension SettingsOptionExtension on SettingsOption {
  String name(L10n strings) {
    switch (this) {
      case SettingsOption.sound:
        return strings.settingsSound;
      case SettingsOption.music:
        return strings.settingsMusic;
    }
  }

  String iconPath({required bool isEnabled}) {
    switch (this) {
      case SettingsOption.sound:
        return isEnabled ? GameIcons.soundOn : GameIcons.soundOff;
      case SettingsOption.music:
        return isEnabled ? GameIcons.musicOn : GameIcons.musicOff;
    }
  }
}
