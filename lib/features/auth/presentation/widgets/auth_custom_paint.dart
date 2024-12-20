import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/features/auth/presentation/refactors/auth_custom_painter.dart';

CustomPaint authCustomPaint(BuildContext context) {
  return CustomPaint(
    size: Size.fromHeight(150.h),
    foregroundPainter: AuthCustomPainter(
      gradient: LinearGradient(
        colors: [
          context.color.bluePinkDark!,
          context.color.bluePinkLight!,
        ],
      ),
    ),
  );
}
