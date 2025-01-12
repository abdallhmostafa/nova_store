import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/show_toast.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nova_store/features/auth/presentation/widgets/auth_button.dart';
import 'package:nova_store/features/auth/presentation/widgets/login/auth_bloc_listner.dart';

class SignUpButtonAndBlocListener extends StatelessWidget {
  const SignUpButtonAndBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthBloc>();
    final imageCubit = context.read<UploadImageCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AuthButton(
          isLoading: cubit.state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          isLogin: false,
          onPressed: () {
            if (cubit.formKey.currentState!.validate() &&
                imageCubit.imageUrl.isNotEmpty &&
                cubit.checkConfirmPassword()) {
              cubit.add(AuthEvent.signUp(imageUrl: imageCubit.imageUrl));
            } else if (imageCubit.imageUrl.isEmpty) {
              ShowToast.showToastError(
                message: context.translate(LangKeys.selectImage),
              );
            }
          },
        ),
        const AuthBlocListner(),
      ],
    );
  }
}
