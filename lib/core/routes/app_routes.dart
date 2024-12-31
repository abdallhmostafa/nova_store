import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/common/pages/under_build_page.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/routes/base_route.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/pages/login_page.dart';
import 'package:nova_store/features/auth/presentation/pages/sign_up_page.dart';
import 'package:nova_store/home_page.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homePage:
        return BaseRoute(page: const HomePage());
      case RoutesName.loginPage:
        return BaseRoute(
            page: BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
          child: const LoginPage(),
        ));
      case RoutesName.signUpPage:
        return BaseRoute(page: const SignUpPage());
      default:
        return BaseRoute(page: const UnderBuildPage());
    }
  }
}
