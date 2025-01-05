import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_text_field.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/app_regex.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/widgets/password_text_feild.dart';

class LoginTextFormSection extends StatelessWidget {
  const LoginTextFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    return Form(
      key: authBloc.formKey,
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
                } else if (!AppRegex.isEmailValid(
                    authBloc.emailController.text)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              controller: authBloc.emailController,
            ),
          ),
          PasswordTextFeild(
            controller: authBloc.passwordController,
          ),
        ],
      ),
    );
  }
}
