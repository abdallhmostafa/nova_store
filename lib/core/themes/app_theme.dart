import 'package:flutter/material.dart';
import 'package:nova_store/core/extensions/asset_extention.dart';
import 'package:nova_store/core/extensions/color_extention.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/colors/app_colors_light.dart';
import 'package:nova_store/core/styles/fonts/font_family_helper.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColorsLight.mainColor,
    brightness: Brightness.light,
    primaryColor: AppColorsLight.mainColor,
    extensions: <ThemeExtension>[
      ColorExtenstion.light,
      AssetExtention.light,
    ],
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColorsLight.black,
        fontFamily: FontFamilyHelper.getLocaleFontFamily(),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColorsDark.mainColor,
    brightness: Brightness.dark,
    primaryColor: AppColorsDark.mainColor,
    extensions: <ThemeExtension>[
      ColorExtenstion.dark,
      AssetExtention.dark,
    ],
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColorsDark.white,
        fontFamily: FontFamilyHelper.getLocaleFontFamily(),
      ),
    ),
  );
}
