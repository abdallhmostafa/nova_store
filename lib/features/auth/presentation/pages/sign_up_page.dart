import 'package:flutter/material.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_custom_paint.dart';
import 'package:nova_store/features/auth/presentation/widgets/sign_up/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: authCustomPaint(context),
    );
  }

  SafeArea _body() => const SafeArea(bottom: false, child: SignUpBody());
}
