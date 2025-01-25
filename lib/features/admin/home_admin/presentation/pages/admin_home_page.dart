import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/page/dashboard_page.dart';
import 'package:nova_store/features/admin/menu_admin_page/page/menu_admin_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  Widget page = const DashboardPage();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      borderRadius: 24.r,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      drawerShadowsBackgroundColor: AppColorsDark.mainColor,
      angle: 0,
      
      androidCloseOnBackTap: true,
      // menuScreenTapClose: true,
      // drawerShadowsBackgroundColor:
      //     context.color.mainColor!.withValues(alpha: 0.6),
      menuBackgroundColor: AppColorsDark.blueDark,
      menuScreen: Builder(
        builder: (context) => MenuAdminPage(
          onTap: (widget) {
            setState(() {
              page = widget;
            });
            ZoomDrawer.of(context)!.close();
          },
        ),
      ),
      mainScreen: page,
    );
  }
}
