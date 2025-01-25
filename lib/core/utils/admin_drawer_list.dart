import 'package:flutter/material.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';

import 'package:nova_store/features/admin/add_categories/presentation/page/add_categore_page.dart';
import 'package:nova_store/features/admin/add_notifications/presentation/page/add_notification_admin_page.dart';
import 'package:nova_store/features/admin/add_products/presentation/page/add_product_page.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/page/dashboard_page.dart';
import 'package:nova_store/features/client/presentation/pages/client_home_page.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      iconName: Icons.dashboard,
      title: context.translate(LangKeys.dashBoard),
      page: const DashboardPage(),
    ),
    //Categories
    DrawerItemModel(
      iconName: Icons.category_outlined,
      title: context.translate(LangKeys.categories),
      page: const AddCategorePage(),
    ),
    //Product
    DrawerItemModel(
      iconName: Icons.apps_rounded,
      title: context.translate(LangKeys.products),
      page: const AddProductPage(),
    ),
    //Users
    DrawerItemModel(
      iconName: Icons.people_alt_rounded,
      title: context.translate(LangKeys.users),
      page: const ClientHomePage(),
    ),
    //Notifications
    DrawerItemModel(
      iconName: Icons.notifications_active,
      title: context.translate(LangKeys.notifications),
      page: const AddNotificationAdminPage(),
    ),
    // //LogOut
    // DrawerItemModel(
    //   iconName: Icons.exit_to_app,
    //   title: context.translate(LangKeys.logOut),
    //   page: const LoginPage(),
    // ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.iconName,
    required this.title,
    required this.page,
  });

  final IconData iconName;
  final String title;
  final Widget page;
}
