import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    required this.text,

    super.key,
    this.lastRadius,
    this.threeRadius,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.loadingWidth = 30,
    this.loadingHeight = 30,
  });
  final VoidCallback onPressed;
  final String text;

  final double? threeRadius;
  final double? lastRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final double? loadingWidth;
  final double? loadingHeight;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(50.h),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor:
            backgroundColor ?? context.color.mainColor, //Todo:it was blac,,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(threeRadius ?? 20),
            topRight: Radius.circular(threeRadius ?? 20),
            bottomRight: Radius.circular(threeRadius ?? 20),
            bottomLeft: Radius.circular(lastRadius ?? 0),
          ),
        ),
      ),
      onPressed: onPressed,
      child: TextApp(
        theme: context.textStyle.copyWith(
          color: textColor ?? context.color.textColor,
          fontWeight: FontWieghtHelper.medium,
          fontSize: 16.sp,
        ),
        text: text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
