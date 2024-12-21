part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.themeChangedMode({required bool isDark}) =
      ThemeChangedMode;

  const factory AppState.changeLanguage({required Locale language}) =
      ChangeLanguageState;
}
