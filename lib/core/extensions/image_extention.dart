import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/assets/app_image_assets.dart';

class ImageExtention extends ThemeExtension<ImageExtention> {
  ImageExtention({
    this.bigNavBar,
    this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<ImageExtention> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return ImageExtention(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<ImageExtention> lerp(
    covariant ThemeExtension<ImageExtention>? other,
    double t,
  ) {
    {
      if (other is! ImageExtention) {
        return this;
      }
      return ImageExtention(
        bigNavBar: bigNavBar,
        homeBg: homeBg,
      );
    }
  }

  static final ImageExtention light = ImageExtention(
    bigNavBar: AppImageAssets.bigIconNavBarLight,
    homeBg: AppImageAssets.homeBgLight,
  );
  static final ImageExtention dark = ImageExtention(
    bigNavBar: AppImageAssets.bigIconNavBarDark,
    homeBg: AppImageAssets.homeBgDark,
  );
}
