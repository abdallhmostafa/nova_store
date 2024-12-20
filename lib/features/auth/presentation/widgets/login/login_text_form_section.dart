import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_text_field.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/app_regex.dart';

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
          const PasswordTextFormField(),
        ],
      ),
    );
  }
}

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({super.key});

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscurePassword = true;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: AppConstant.fadeInDuration,
      child: CustomTextField(
        hintText: context.translate(LangKeys.password),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your password';
          } else if (!AppRegex.isPasswordValid(value)) {
            return 'Please enter a valid password';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        },
        controller: controller,
        obscureText: _obscurePassword,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon:
              Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
