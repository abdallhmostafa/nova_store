import 'package:flutter/material.dart';
import 'package:nova_store/features/auth/presentation/refactors/login_body.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_custom_paint.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: authCustomPaint(context),
    );
  }

  SafeArea _body() => const SafeArea(bottom: false, child: LoginBody());
}
