import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/admin/admin_custom_container.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/assets/app_image_assets.dart';
import 'package:nova_store/core/utils/space.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_categories_number_admin_dashboard_cubit/get_categories_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_products_number_admin_dashboard_cubit/get_products_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_users_number_admin_dashboard_cubit/get_users_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/widgets/enum_admin_dashboard_number.dart';

class DashboardPageBody extends StatelessWidget {
  const DashboardPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      color: context.color.navBarSelectedTab,
      semanticsLabel: context.translate(LangKeys.refresh),
      semanticsValue: context.translate(LangKeys.refresh),
      onRefresh: () async {
        await Future.wait([
          context.read<GetUsersNumberAdminDashboardCubit>().getUsersNumber(),
          context
              .read<GetProductsNumberAdminDashboardCubit>()
              .getProductsNumber(),
          context
              .read<GetCategoriesNumberAdminDashboardCubit>()
              .getCategoriesNumber(),
        ]);
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          AdminCustomContainer(
            title: context.translate(LangKeys.products),
            image: AppImageAssets.productsDrawer,
            type: AdminDashboardNumberType.products,
          ),
          verticalSpace(20),
          AdminCustomContainer(
            title: context.translate(LangKeys.categories),
            image: AppImageAssets.categoriesDrawer,
            type: AdminDashboardNumberType.categories,
          ),
          verticalSpace(20),
          AdminCustomContainer(
            title: context.translate(LangKeys.users),
            image: AppImageAssets.usersDrawer,
            type: AdminDashboardNumberType.users,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
