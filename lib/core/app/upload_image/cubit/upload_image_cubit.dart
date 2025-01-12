import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_store/core/app/upload_image/model/upload_image_response_model.dart';
import 'package:nova_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/utils/app_image_pick.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._uploadImageRepo)
      : super(const UploadImageState.initial());
  final UploadImageRepo _uploadImageRepo;

  String imageUrl = '';
  Future<XFile?> pickImage() async => AppImagePick.pickImage();
  Future<void> uploadImage() async {
    final xFile = await pickImage();
    if (xFile == null) {
      emit(
        UploadImageState.error(
          error: ApiErrorModel(message: 'No Image Selected'),
        ),
      );
      return;
    }
    emit(const UploadImageState.loading());
    final result = await _uploadImageRepo.uploadImage(file: xFile);
    result.whenOrNull(
      success: (response) {
        imageUrl = response.location!;
        log('ImageUrl: $imageUrl');
        emit(UploadImageState.success(response: response));
      },
      failure: (error) {
        emit(UploadImageState.error(error: error));
      },
    );
  }

  Future<void> removeImage() async {
    emit(UploadImageState.remove(url: imageUrl));
  }
}
