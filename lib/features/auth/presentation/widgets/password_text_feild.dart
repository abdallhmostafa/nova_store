import 'package:flutter/material.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_text_field.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/app_regex.dart';

class PasswordTextFeild extends StatefulWidget {
  const PasswordTextFeild(
      {super.key, this.isConfirmPassword = false, required this.controller});
  final bool isConfirmPassword;
  final TextEditingController controller;

  @override
  State<PasswordTextFeild> createState() => _PasswordTextFeildState();
}

class _PasswordTextFeildState extends State<PasswordTextFeild> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: AppConstant.fadeInDuration,
      child: CustomTextField(
        hintText: context.translate(
          widget.isConfirmPassword
              ? LangKeys.confirmPassword
              : LangKeys.password,
        ),
        validator: (value) {
          return widget.isConfirmPassword
              ? _passConfirmValidate(value)
              : _passValidate(value);
        },
        controller: widget.controller,
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

  String? _passValidate(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your password';
    } else if (!AppRegex.isPasswordValid(value)) {
      return 'Please enter a valid password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _passConfirmValidate(String? value) {
    if (value!.isEmpty) {
      return 'Please confirm your password';
    } else if (value != widget.controller.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
