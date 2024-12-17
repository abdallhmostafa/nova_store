// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/colors/app_colors_light.dart';

class ColorExtenstion extends ThemeExtension<ColorExtenstion> {
  final Color mainColor;
  ColorExtenstion({
    required this.mainColor,
  });
  @override
  ThemeExtension<ColorExtenstion> copyWith() {
    return ColorExtenstion(
      mainColor: mainColor,
    );
  }

  @override
  ThemeExtension<ColorExtenstion> lerp(
    covariant ThemeExtension<ColorExtenstion>? other,
    double t,
  ) {
    return ColorExtenstion(
      mainColor: mainColor,
    );
  }

  static final ColorExtenstion light = ColorExtenstion(
    mainColor: AppColorsLight.mainColor,
  );
  static final ColorExtenstion dark = ColorExtenstion(
    mainColor: AppColorsDark.mainColor,
  );
}
