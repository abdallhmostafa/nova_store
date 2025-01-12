import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit_bloc_listner.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';

class SignUpAvatarImage extends StatelessWidget {
  const SignUpAvatarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadImageCubit, UploadImageState>(
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        return GestureDetector(
          onTap:  cubit.uploadImage,
          child: CustomFadeInDown(
            duration: AppConstant.fadeInDuration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 51,
                  backgroundColor: state is Success
                      ? context.color.bluePinkLight
                      : Colors.transparent,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
                    backgroundImage:
                        state is Success ? NetworkImage(cubit.imageUrl) : null,
                    child: state is Loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : state is Success
                            ? _removeImageButton(cubit)
                            : const Icon(
                                Icons.photo_library_rounded,
                                color: Colors.white,
                              ),
                  ),
                ),
                const UploadImageCubitBlocListner(),
              ],
            ),
          ),
        );
      },
    );
  }

  GestureDetector _removeImageButton(UploadImageCubit cubit) {
    return GestureDetector(
      onTap: cubit.removeImage,
      child: const Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 5,
            right: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
