import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDarkMode = false;
  Future<void> changeTheme({bool? themeMode}) async {
    if (themeMode != null) {
      isDarkMode = themeMode;
    } else {
      isDarkMode = !isDarkMode;
     await SharedPref.setBoolean(PrefKeys.themeMode, booleanValue: isDarkMode);
    }
    emit(AppState.themeChangedMode(isDark: isDarkMode));
  }
}
