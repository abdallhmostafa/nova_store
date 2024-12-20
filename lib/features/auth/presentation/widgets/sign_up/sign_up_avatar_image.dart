import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/constants/app_constant.dart';

class SignUpAvatarImage extends StatelessWidget {
  const SignUpAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: AppConstant.fadeInDuration,
      child: CircleAvatar(
        radius: 60,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
        child: Icon(Icons.add_a_photo, size: 30.w),
      ),
    );
  }
}
