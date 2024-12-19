import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/common/widgets/custom_linear_button.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';

class DarkAndLangSection extends StatelessWidget {
  const DarkAndLangSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: AppConstant.fadeInDuration,
          child: CustomLinearButton(
            onPressed: () {},
            child: Theme.of(context).brightness == Brightness.dark
                ? const Icon(Icons.wb_sunny)
                : const Icon(
                    Icons.nightlight_round,
                    color: Colors.white,
                  ),
          ),
        ),
        CustomFadeInLeft(
          duration: AppConstant.fadeInDuration,
          child: CustomLinearButton(
            width: 100.w,
            onPressed: () {},
            child: TextApp(
              text: context.translate(LangKeys.language),
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWieghtHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
