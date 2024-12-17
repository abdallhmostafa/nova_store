import 'package:flutter/material.dart';
import 'package:nova_store/core/extensions/color_extention.dart';
import 'package:nova_store/core/extensions/image_extention.dart';
import 'package:nova_store/core/lang/app_localizations.dart';

extension ContextExtention on BuildContext {
// -------------------------- Color Extention -------------------------- //
  ColorExtenstion get color => Theme.of(this).extension<ColorExtenstion>()!;

// -------------------------- Image Extention -------------------------- //
  ImageExtention get image => Theme.of(this).extension<ImageExtention>()!;

// -------------------------- Language -------------------------- //

  String translate(String langKey) =>
      AppLocalizations.of(this)!.translate(langKey).toString();

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
