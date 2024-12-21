import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';
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
    final cubit = context.read<AppCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: AppConstant.fadeInDuration,
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return CustomLinearButton(
                onPressed: cubit.changeTheme,
                child: Icon(
                  cubit.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
        CustomFadeInLeft(
          duration: AppConstant.fadeInDuration,
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return CustomLinearButton(
                width: 100.w,
                onPressed: () {},
                child: TextApp(
                  text: context.translate(LangKeys.language),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWieghtHelper.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
