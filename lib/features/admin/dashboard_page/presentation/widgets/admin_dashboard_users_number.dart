import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/loading/loading_shimmer.dart';
import 'package:nova_store/core/common/widgets/text_app.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/styles/fonts/font_wieght_helper.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_users_number_admin_dashboard_cubit/get_users_number_admin_dashboard_cubit.dart';

class AdminDashboardUsersNumber extends StatelessWidget {
  const AdminDashboardUsersNumber({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersNumberAdminDashboardCubit,
        GetUsersNumberAdminDashboardState>(
      builder: (context, state) {
        return state.when(
          loading: () => const LoadingShimmer(),
          success: (categories) => TextApp(
            theme: context.textStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWieghtHelper.bold,
            ),
            text: categories.data?.users?.length.toString() ?? '0',
          ),
          error: (failure) => TextApp(
            theme: context.textStyle.copyWith(
              color: Colors.red,
            ),
            textOverflow: TextOverflow.ellipsis,
            text: failure,
          ),
        );
      },
    );
  }
}
