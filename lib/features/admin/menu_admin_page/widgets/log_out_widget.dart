import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/custom_dialogs.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:nova_store/core/utils/func/logout.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _logOut(context);
      },
      leading: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      title: TextApp(
        textAlign: TextAlign.start,
        text: context.translate(LangKeys.logOut),
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWieghtHelper.bold,
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    return CustomDialog.twoButtonDialog(
      context: context,
      textBody: context.translate(LangKeys.doYouWantToLogOut),
      textButton1: context.translate(LangKeys.yes),
      textButton2: context.translate(LangKeys.no),
      isLoading: false,
      onPressed: () async {
        context.pushNamedAndRemoveUntil(
          RoutesName.loginPage,
          (route) => false,
        );

        await logout();
      },
    );
  }
}
