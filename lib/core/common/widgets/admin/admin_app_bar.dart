import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar({
    required this.title,
    this.backgroundColor = AppColorsDark.mainColor,
    this.isMain = true,
    super.key,
  });
  final Color backgroundColor;
  final String title;
  final bool isMain;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: context.textStyle.copyWith(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWieghtHelper.bold,
        ),
      ),
      leading: isMain
          ? IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              color: Colors.white,
              icon: Icon(
                Icons.menu_rounded,
                size: 24.sp,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
