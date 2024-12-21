import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';

abstract class FontFamilyHelper {
  static const String arabicFontCairo = 'Cairo';
  static const String englishFontPoppins = 'Poppins';
  static String getLocaleFontFamily() {
    final currentLanguageCode =
        SharedPref.getString(PrefKeys.language) ?? 'en';
    if (currentLanguageCode == 'ar') {
      return arabicFontCairo;
    } else {
      return englishFontPoppins;
    }
  }
}
