import 'package:flutter/material.dart';
import 'package:nova_store/core/extensions/asset_extention.dart';
import 'package:nova_store/core/extensions/color_extention.dart';
import 'package:nova_store/core/lang/app_localizations.dart';

extension ContextExtention on BuildContext {
// -------------------------- Color Extention -------------------------- //
  ColorExtenstion get color => Theme.of(this).extension<ColorExtenstion>()!;

// -------------------------- Image Extention -------------------------- //
  AssetExtention get image => Theme.of(this).extension<AssetExtention>()!;

// -------------------------- Language -------------------------- //

  String translate(String langKey) =>
      AppLocalizations.of(this)!.translate(langKey).toString();

  // -------------------------- TextStyle -------------------------- //

  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  // -------------------------- Navigator -------------------------- //
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  void pushNamedAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    Navigator.of(this).popUntil(predicate);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
