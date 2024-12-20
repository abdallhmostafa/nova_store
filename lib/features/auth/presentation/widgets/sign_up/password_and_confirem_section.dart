import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/features/auth/presentation/widgets/password_text_feild.dart';

class PasswordAndConfiremSection extends StatelessWidget {
  const PasswordAndConfiremSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25.h,
      children: [
        PasswordTextFeild(
          controller: TextEditingController(),
        ),
        PasswordTextFeild(
          isConfirmPassword: true,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}
