part of 'settings_cubit.dart';

@immutable
class SettingsState extends Equatable {
  const SettingsState({
    required this.isMusicOn,
    required this.isSoundOn,
  });

  factory SettingsState.initial() => const SettingsState(
        isMusicOn: true,
        isSoundOn: true,
      );

  final bool isMusicOn;
  final bool isSoundOn;

  @override
  List<Object?> get props => [isMusicOn, isSoundOn];

  SettingsState copyWith({
    bool? isMusicOn,
    bool? isSoundOn,
  }) {
    return SettingsState(
      isMusicOn: isMusicOn ?? this.isMusicOn,
      isSoundOn: isSoundOn ?? this.isSoundOn,
    );
  }
}
