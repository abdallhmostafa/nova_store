import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:nova_store/core/common/pages/under_build_page.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/routes/base_route.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/features/admin/home_admin/presentation/pages/admin_home_page.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/pages/login_page.dart';
import 'package:nova_store/features/auth/presentation/pages/sign_up_page.dart';
import 'package:nova_store/features/client/presentation/pages/client_home_page.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  // static var signUpPage;

  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.dashboardPage:
      //   return BaseRoute(
      //     
      //       child: const DashboardPage(),
      //     ),
      //   );

      case RoutesName.loginPage:
        return BaseRoute(
          page: BlocProvider(
            create: (context) => serviceLocator<AuthBloc>(),
            child: const LoginPage(),
          ),
        );
      case RoutesName.signUpPage:
        return BaseRoute(
          page: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => serviceLocator<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => serviceLocator<AuthBloc>(),
              ),
            ],
            child: const SignUpPage(),
          ),
        );
      case RoutesName.adminHomePage:
        return BaseRoute(page: const AdminHomePage());
      case RoutesName.clientHomePage:
        return BaseRoute(page: const ClientHomePage());
      default:
        return BaseRoute(page: const UnderBuildPage());
    }
  }
}
