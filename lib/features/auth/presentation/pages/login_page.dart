import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/features/auth/presentation/refactors/auth_custom_painter.dart';
import 'package:nova_store/features/auth/presentation/refactors/login_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      bottomNavigationBar: _customPaint(context),
    );
  }

  SafeArea _body() => const SafeArea(bottom: false, child: LoginBody());

  CustomPaint _customPaint(BuildContext context) {
    return CustomPaint(
      size: Size(
        double.infinity,
        150.h,
      ),
      painter: AuthCustomPainter(
        gradient: LinearGradient(
          colors: [
            context.color.bluePinkDark!,
            context.color.bluePinkLight!,
          ],
        ),
      ),
    );
  }
}
