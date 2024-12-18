import 'package:flutter/material.dart';
import 'package:nova_store/core/extensions/asset_extention.dart';
import 'package:nova_store/core/extensions/color_extention.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/colors/app_colors_light.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColorsLight.mainColor,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    extensions: <ThemeExtension>[
      ColorExtenstion.light,
      AssetExtention.light,
    ],
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColorsDark.mainColor,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    extensions: <ThemeExtension>[
      ColorExtenstion.dark,
      AssetExtention.dark,
    ],
  );
}
