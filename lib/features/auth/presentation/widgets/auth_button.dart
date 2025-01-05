import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_linear_button.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.onPressed,
    this.isLogin = true,
    this.isLoading = false,
    super.key,
  });
  final void Function() onPressed;
  final bool isLogin;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: AppConstant.fadeInDuration,
      child: CustomLinearButton(
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                backgroundColor: Colors.white,
                semanticsLabel: context.translate(LangKeys.loading),
                semanticsValue: context.translate(LangKeys.loading),
                color: context.color.mainColor,
                strokeWidth: 3,
              )
            : TextApp(
                text: context
                    .translate(isLogin ? LangKeys.login : LangKeys.signUp),
                theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWieghtHelper.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
