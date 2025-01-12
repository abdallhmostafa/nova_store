import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/colors/app_colors_light.dart';

class ColorExtenstion extends ThemeExtension<ColorExtenstion> {
  ColorExtenstion({
    this.mainColor,
    this.bluePinkDark,
    this.bluePinkLight,
    this.textColor,
    this.textFormBorder,
    this.navBarbg,
    this.navBarSelectedTab,
    this.containerShadow1,
    this.containerShadow2,
    this.containerLinear1,
    this.containerLinear2,
    this.pinkLightWithOpacity,
  });
  final Color? mainColor;
  final Color? bluePinkDark;
  final Color? bluePinkLight;
  final Color? textColor;
  final Color? textFormBorder;
  final Color? pinkLightWithOpacity;
  final Color? navBarbg;
  final Color? navBarSelectedTab;
  final Color? containerShadow1;
  final Color? containerShadow2;
  final Color? containerLinear1;
  final Color? containerLinear2;

  @override
  ThemeExtension<ColorExtenstion> copyWith({
    Color? mainColor,
    Color? bluePinkDark,
    Color? bluePinkLight,
    Color? textColor,
    Color? textFormBorder,
    Color? navBarbg,
    Color? navBarSelectedTab,
    Color? containerShadow1,
    Color? containerShadow2,
    Color? containerLinear1,
    Color? pinkLightWithOpacity,
  }) {
    return ColorExtenstion(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      pinkLightWithOpacity: pinkLightWithOpacity,
    );
  }

  @override
  ThemeExtension<ColorExtenstion> lerp(
    covariant ThemeExtension<ColorExtenstion>? other,
    double t,
  ) {
    return ColorExtenstion(
      mainColor: mainColor,
      bluePinkDark: bluePinkDark,
      bluePinkLight: bluePinkLight,
      textColor: textColor,
      textFormBorder: textFormBorder,
      navBarbg: navBarbg,
      navBarSelectedTab: navBarSelectedTab,
      containerShadow1: containerShadow1,
      containerShadow2: containerShadow2,
      containerLinear1: containerLinear1,
      containerLinear2: containerLinear2,
      pinkLightWithOpacity: pinkLightWithOpacity,
    );
  }

  static final ColorExtenstion light = ColorExtenstion(
    mainColor: AppColorsLight.mainColor,
    bluePinkDark: AppColorsLight.pinkDark,
    bluePinkLight: AppColorsLight.pinkLight,
    textColor: AppColorsLight.black,
    textFormBorder: AppColorsLight.pinkLight,
    navBarbg: AppColorsLight.mainColor,
    navBarSelectedTab: AppColorsLight.pinkDark,
    containerShadow1: AppColorsLight.white,
    containerShadow2: AppColorsLight.white,
    containerLinear1: AppColorsLight.pinkDark,
    containerLinear2: AppColorsLight.pinkLight,
    pinkLightWithOpacity: AppColorsLight.pinkLightWithOpacity,
  );
  static final ColorExtenstion dark = ColorExtenstion(
    mainColor: AppColorsDark.mainColor,
    bluePinkDark: AppColorsDark.blueDark,
    bluePinkLight: AppColorsDark.blueLight,
    textColor: AppColorsDark.white,
    textFormBorder: AppColorsDark.blueLight,
    navBarbg: AppColorsDark.navBarDark,
    navBarSelectedTab: AppColorsDark.white,
    containerShadow1: AppColorsDark.black1,
    containerShadow2: AppColorsDark.black2,
    containerLinear1: AppColorsDark.black1,
    containerLinear2: AppColorsDark.black2,
    pinkLightWithOpacity: AppColorsDark.blueLightWithOpacity,
  );
}
