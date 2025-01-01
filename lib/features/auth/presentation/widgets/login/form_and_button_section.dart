import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_button.dart';
import 'package:nova_store/features/auth/presentation/widgets/login/login_bloc_listner.dart';
import 'package:nova_store/features/auth/presentation/widgets/login/login_text_form_section.dart';

class FormAndButtonSection extends StatelessWidget {
  const FormAndButtonSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 25.h,
      children: [
        const LoginTextFormSection(),
        const LoginBlocListner(),
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final authBloc = context.read<AuthBloc>();
            return AuthButton(
              isLoading: state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
              onPressed: () {
                if (authBloc.formKey.currentState!.validate()) {
                  authBloc.add(
                    const AuthEvent.login(),
                  );
                }
              },
            );
          },
        ),
      ],
    );
  }
}
