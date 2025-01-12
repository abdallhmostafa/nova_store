import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/widgets/password_text_feild.dart';

class PasswordAndConfiremSection extends StatelessWidget {
  const PasswordAndConfiremSection({super.key});
  @override
  Widget build(BuildContext context) {
  final cubit = context.read<AuthBloc>();
    return Column(
      spacing: 25.h,
      children: [
        PasswordTextFeild(
          controller: cubit.passwordController,
        ),
        PasswordTextFeild(
          isConfirmPassword: true,
          controller: cubit.confirmPasswordController,
          mainPasswordController: cubit.passwordController,
        ),
      ],
    );
  }
}
