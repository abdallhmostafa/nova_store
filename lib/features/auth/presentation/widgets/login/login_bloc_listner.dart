import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/core/utils/show_toast.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';

class LoginBlocListner extends StatelessWidget {
  const LoginBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          loginSuccess: (response, userRole) {
            ShowToast.showToastSuccessTop(
              context: context,
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
            } else {
              ShowToast.showToastErrorTop(
                context: context,
                message: 'user role not found',
              );
            }
          },
          orElse: () {},
          error: (error) {
            ShowToast.showToastErrorTop(
              context: context,
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
