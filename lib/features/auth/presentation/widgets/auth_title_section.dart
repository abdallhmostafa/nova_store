import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class AuthTitleSection extends StatelessWidget {
  const AuthTitleSection({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: AppConstant.fadeInDuration,
      child: Column(
        spacing: 10.h,
        children: [
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWieghtHelper.bold,
              color: context.color.textColor,
            ),
          ),
          TextApp(
            text: description,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWieghtHelper.medium,
              color: context.color.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
