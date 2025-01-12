import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/core/utils/show_toast.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';

class AuthBlocListner extends StatelessWidget {
  const AuthBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loginSuccess: (response, userRole) {
            ShowToast.showToastSuccess(
              message: context.translate(LangKeys.loggedSuccessfully),
            );
            if (userRole == 'admin') {
              context.pushNamedAndRemoveUntil(
                RoutesName.adminHomePage,
                (route) => false,
              );
            } else if (userRole == 'customer') {
              context.pushNamedAndRemoveUntil(
                RoutesName.clientHomePage,
                (route) => false,
              );
            } else if (userRole == null || userRole.isEmpty) {
              ShowToast.showToastError(
                message: 'user role not found',
              );
            }
          },
          signUpSuccess: (response) {
            ShowToast.showToastSuccess(
              message: context.translate(LangKeys.signUpSuccessfully),
            );
            // Future.delayed(const Duration(seconds: 3), () {
            //   ShowToast.showToastSuccess(
            //     seconds: 4,
            //     message: context.translate(
            //       LangKeys.loginToAccount,
            //     ),
            //   );
            // });
          },
          orElse: () {},
          error: (error) {
            ShowToast.showToastError(
              message: error.isEmpty
                  ? context.translate(LangKeys.loggedError)
                  : error,
            );
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
