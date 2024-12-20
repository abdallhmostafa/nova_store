import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_text_field.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/app_regex.dart';
import 'package:nova_store/features/auth/presentation/widgets/password_text_feild.dart';

class LoginTextFormSection extends StatelessWidget {
  const LoginTextFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 25.h,
        children: [
          CustomFadeInLeft(
            duration: AppConstant.fadeInDuration,
            child: CustomTextField(
              hintText: context.translate(LangKeys.email),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (!AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: TextEditingController(),
            ),
          ),
          PasswordTextFeild(
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
