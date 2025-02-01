import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/loading/loading_shimmer.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/colors/app_colors_dark.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class AdminCustomContainer extends StatelessWidget {
  const AdminCustomContainer({
    required this.title,
    required this.count,
    required this.image,
    this.isLoading = false,
    super.key,
  });
  final bool isLoading;
  final String title;
  final String count;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: _boxDecoration(),
      child: _child(context),
    );
  }

  Row _child(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                theme: context.textStyle.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWieghtHelper.bold,
                ),
                text: title,
              ),
              if (isLoading)
                const LoadingShimmer()
              else
                TextApp(
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWieghtHelper.bold,
                  ),
                  text: count,
                ),
            ],
          ),
        ),
        Image.asset(
          image,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
      gradient: LinearGradient(
        colors: [
          AppColorsDark.black1.withValues(alpha: 0.8),
          AppColorsDark.black2.withValues(alpha: 0.8),
        ],
        begin: const Alignment(0.36, 0.27),
        end: const Alignment(0.58, 0.85),
      ),
      boxShadow: [
        BoxShadow(
          color: AppColorsDark.black1.withValues(alpha: 0.3),
          offset: const Offset(0, 4),
          blurRadius: 8,
        ),
        BoxShadow(
          color: AppColorsDark.black2.withValues(alpha: 0.3),
          offset: const Offset(0, 4),
          blurRadius: 2,
        ),
      ],
    );
  }
}
