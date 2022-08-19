/// Picked value from [GameSprites] returns the path to the game sprite asset.
/// Proceeded by 'assets/images/' as required by Flame.
abstract class GameSprites {}

/// Picked value from [GameIcons] returns the path to the game sprite asset.
abstract class GameIcons {
  static const String close = 'assets/images/icons/close.png';
  static const String settings = 'assets/images/icons/settings.png';
  static const String pause = 'assets/images/icons/pause.png';
  static const String play = 'assets/images/icons/play.png';
  static const String home = 'assets/images/icons/home.png';
  static const String musicOn = 'assets/images/icons/music_on.png';
  static const String musicOff = 'assets/images/icons/music_off.png';
  static const String soundOn = 'assets/images/icons/sound_on.png';
  static const String soundOff = 'assets/images/icons/sound_off.png';

  static const List<String> iconsToPreload = [
    close,
    settings,
    pause,
    play,
    home,
    musicOn,
    musicOff,
    soundOn,
    soundOff,
  ];
}
