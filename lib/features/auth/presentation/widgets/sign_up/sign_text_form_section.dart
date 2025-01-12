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
import 'package:nova_store/features/auth/presentation/widgets/sign_up/password_and_confirem_section.dart';

class SignTextFormSection extends StatelessWidget {
  const SignTextFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthBloc>();
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: 25.h,
        children: [
          CustomFadeInLeft(
            duration: AppConstant.fadeInDuration,
            child: CustomTextField(
              hintText: context.translate(LangKeys.fullName),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your full name';
                } else if (value.length < 3) {
                  return 'Full name must be at least 3 characters';
                }
                return null;
              },
              controller: cubit.nameController,
            ),
          ),
          CustomFadeInRight(
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
              controller: cubit.emailController,
            ),
          ),
          CustomFadeInRight(
            duration: AppConstant.fadeInDuration,
            child: const PasswordAndConfiremSection(),
          ),
        ],
      ),
    );
  }
}
