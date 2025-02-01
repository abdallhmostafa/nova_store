import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/admin/admin_custom_container.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/assets/app_image_assets.dart';
import 'package:nova_store/core/utils/space.dart';

class DashboardPageBody extends StatelessWidget {
  const DashboardPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      color: context.color.navBarSelectedTab,
      semanticsLabel: context.translate(LangKeys.refresh),
      semanticsValue: context.translate(LangKeys.refresh),
      onRefresh: () async {},
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        children: [
          AdminCustomContainer(
            title: context.translate(LangKeys.products),
            count: 0.toString(),
            image: AppImageAssets.productsDrawer,
          ),
          verticalSpace(20),
          AdminCustomContainer(
            title: context.translate(LangKeys.categories),
            count: 0.toString(),
            image: AppImageAssets.categoriesDrawer,
          ),
          verticalSpace(20),
          AdminCustomContainer(
            title: context.translate(LangKeys.users),
            count: 0.toString(),
            image: AppImageAssets.usersDrawer,
          ),
          verticalSpace(20),
        ],
      ),
    );
  }
}
