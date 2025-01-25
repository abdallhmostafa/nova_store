import 'dart:developer';

import 'package:flutter/material.dart';

class AppNavigationObserver extends NavigatorObserver {
  factory AppNavigationObserver() => _instance;
  AppNavigationObserver._();
  static final AppNavigationObserver _instance = AppNavigationObserver._();
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    log('previous Route: ${previousRoute?.settings.name}');
    log('Route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    log('Route popped: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    log('Route removed: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log('Route replaced: ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }
}
