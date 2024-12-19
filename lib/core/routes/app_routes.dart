import 'package:flutter/material.dart';
import 'package:nova_store/core/common/pages/under_build_page.dart';
import 'package:nova_store/core/routes/base_route.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/features/auth/presentation/pages/login_page.dart';
import 'package:nova_store/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homePage:
        return BaseRoute(page: const HomePage());
      case RoutesName.loginPage:
        return BaseRoute(page: const LoginPage());

      default:
        return BaseRoute(page: const UnderBuildPage());
    }
  }
}
