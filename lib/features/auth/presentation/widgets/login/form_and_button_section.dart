import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_button.dart';
import 'package:nova_store/features/auth/presentation/widgets/login/login_text_form_section.dart';

class FormAndButtonSection extends StatelessWidget {
  const FormAndButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25.h,
      children: [
        LoginTextFormSection(),
        AuthButton(
          onPressed: () {},
        ),
      ],
    );
  }
}
