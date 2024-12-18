import 'package:flutter/material.dart';
import 'package:nova_store/core/styles/assets/app_image_assets.dart';

class AssetExtention extends ThemeExtension<AssetExtention> {
  AssetExtention({
    this.bigNavBar,
    this.homeBg,
  });

  final String? bigNavBar;
  final String? homeBg;

  @override
  ThemeExtension<AssetExtention> copyWith({
    String? bigNavBar,
    String? homeBg,
  }) {
    return AssetExtention(
      bigNavBar: bigNavBar,
      homeBg: homeBg,
    );
  }

  @override
  ThemeExtension<AssetExtention> lerp(
    covariant ThemeExtension<AssetExtention>? other,
    double t,
  ) {
    {
      if (other is! AssetExtention) {
        return this;
      }
      return AssetExtention(
        bigNavBar: bigNavBar,
        homeBg: homeBg,
      );
    }
  }

  static final AssetExtention light = AssetExtention(
    bigNavBar: AppImageAssets.bigIconNavBarLight,
    homeBg: AppImageAssets.homeBgLight,
  );
  static final AssetExtention dark = AssetExtention(
    bigNavBar: AppImageAssets.bigIconNavBarDark,
    homeBg: AppImageAssets.homeBgDark,
  );
}
