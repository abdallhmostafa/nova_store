import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/custom_button.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class CustomDialog {
  const CustomDialog._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog.adaptive(
        backgroundColor: AppColorsDark.mainColor,
        title: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
            bottom: 20.h,
          ),
          child: TextApp(
            text: textBody,
            theme: context.textStyle.copyWith(
              fontWeight: FontWieghtHelper.medium,
              fontSize: 18.sp,
              color: context.color.textColor,
            ),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          CustomButton(
            backgroundColor: Colors.red,
            onPressed: onPressed,
            text: textButton1,
            isLoading: isLoading,
            lastRadius: 10,
            threeRadius: 10,
          ),
          SizedBox(height: 10.h, width: 1.w),
          CustomButton(
            backgroundColor: Colors.green,
            onPressed: () {
              context.pop();
            },
            text: textButton2,
            lastRadius: 10,
            threeRadius: 10,
          ),
        ],
      ),
    );
  }
}
