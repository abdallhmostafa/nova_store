import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/common/widgets/admin/admin_app_bar.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_categories_number_admin_dashboard_cubit/get_categories_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_products_number_admin_dashboard_cubit/get_products_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_users_number_admin_dashboard_cubit/get_users_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/refactors/dashboard_page_body.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator<GetCategoriesNumberAdminDashboardCubit>()
                ..getCategoriesNumber(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<GetUsersNumberAdminDashboardCubit>()
                ..getUsersNumber(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator<GetProductsNumberAdminDashboardCubit>()
                ..getProductsNumber(),
        ),
      ],
      child: Scaffold(
        appBar: AdminAppBar(
          title: context.translate(LangKeys.dashBoard),
        ),
        body: const DashboardPageBody(),
      ),
    );
  }
}
