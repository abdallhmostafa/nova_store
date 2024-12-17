import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/assets/app_image_assets.dart';

class ImageExtention extends ThemeExtension<ImageExtention> {
  ImageExtention({
    required this.logoTest,
  });
  final String logoTest;
  @override
  ThemeExtension<ImageExtention> copyWith() {
    return ImageExtention(
      logoTest: logoTest,
    );
  }

  @override
  ThemeExtension<ImageExtention> lerp(
    covariant ThemeExtension<ImageExtention>? other,
    double t,
  ) {
    return ImageExtention(
      logoTest: logoTest,
    );
  }

  static final ImageExtention light = ImageExtention(
    logoTest: AppImageAssets.logoLight,
  );
  static final ImageExtention dark = ImageExtention(
    logoTest: AppImageAssets.logoDark,
  );
}
