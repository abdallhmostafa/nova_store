import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/admin_app_bar.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:nova_store/core/utils/admin_drawer_list.dart';
import 'package:nova_store/features/admin/menu_admin_page/widgets/log_out_widget.dart';

class MenuAdminPage extends StatelessWidget {
  const MenuAdminPage({required this.onTap, super.key});
  final void Function(Widget widget) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsDark.blueDark,
      appBar: AdminAppBar(
        backgroundColor: AppColorsDark.blueDark,
        title: context.translate(LangKeys.noveStore),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ...adminDrawerList(context).map(
                (listTile) => ListTile(
                  onTap: () {
                    onTap(listTile.page);
                  },
                  leading: Icon(
                    listTile.iconName,
                    color: Colors.white,
                  ),
                  title: TextApp(
                    textAlign: TextAlign.start,
                    text: listTile.title,
                    theme: context.textStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWieghtHelper.bold,
                    ),
                  ),
                ),
              ),
              const LogOutWidget(),
            ],
          ),
          const FittedBox(
            child: Icon(
              Icons.shopify_rounded,
              size: 300,
            ),
          ),
        ],
      ),
    );
  }
}
