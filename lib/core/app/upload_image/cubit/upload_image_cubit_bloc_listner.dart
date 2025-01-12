import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/lang/lang_keys.dart';
import 'package:nova_store/core/utils/show_toast.dart';

class UploadImageCubitBlocListner extends StatelessWidget {
  const UploadImageCubitBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadImageCubit, UploadImageState>(
      bloc: context.read<UploadImageCubit>(),
      listener: (context, state) {
        if (state is Error) {
          ShowToast.showToastError(message: state.error.message ??
                context.translate(
                  LangKeys.uploadImageError,
                ),
          );
        } else if (state is Success) {
          ShowToast.showToastSuccess(
            seconds: 2,
            message: context.translate(LangKeys.imageUploaded,
            ),
          );
        } else if (state is Loading) {
          ShowToast.showToastLoading(
            seconds: 2,
            message: context.translate(LangKeys.uploadingTheImage),
          );
        } else if (state is Remove) {
          ShowToast.showToastSuccess(
            message:  context.translate(LangKeys.imageRemoved),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
