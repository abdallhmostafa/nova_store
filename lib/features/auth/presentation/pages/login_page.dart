import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/features/auth/presentation/refactors/login_body.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_custom_paint.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150.h,
            child: authCustomPaint(context),
          ),
          const SafeArea(bottom: false, child: LoginBody()),
        ],
      );
}
