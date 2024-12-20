import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_button.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:nova_store/features/auth/presentation/widgets/dark_and_lang_section.dart';
import 'package:nova_store/features/auth/presentation/widgets/login/login_text_form_section.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalPadding,
          vertical: AppConstant.verticalPadding,
        ),
        child: Column(
          spacing: 30.h,
          children: [
            const DarkAndLangSection(),
            AuthTitleSection(
              title: context.translate(LangKeys.login),
              description: context.translate(LangKeys.welcome),
            ),
            const LoginTextFormSection(),
            AuthButton(
              onPressed: () {},
            ),
            CustomFadeInUp(
              duration: AppConstant.fadeInDuration,
              child: GestureDetector(
                onTap: () {
                  context.pushReplacementNamed(RoutesName.signUpPage);
                },
                child: TextApp(
                  text: context.translate(LangKeys.createAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWieghtHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
