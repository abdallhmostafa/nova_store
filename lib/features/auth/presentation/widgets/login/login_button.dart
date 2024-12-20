import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_linear_button.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: AppConstant.fadeInDuration,
      child: CustomLinearButton(
        onPressed: () {},
        child: TextApp(
          text: context.translate(LangKeys.login),
          theme: context.textStyle
              .copyWith(fontSize: 18.sp, fontWeight: FontWieghtHelper.bold),
        ),
      ),
    );
  }
}
