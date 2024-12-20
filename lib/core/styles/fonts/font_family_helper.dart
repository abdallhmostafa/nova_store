abstract class FontFamilyHelper {
  static const String arabicFontCairo = 'Cairo';
  static const String englishFontPoppins = 'Poppins';
  static String getLocaleFontFamily() {
    // todo: add shared preferences to get the current language code
    const currentLanguageCode = 'ar';
    if (currentLanguageCode == 'ar') {
      return arabicFontCairo;
    } else {
      return englishFontPoppins;
    }
  }
}
