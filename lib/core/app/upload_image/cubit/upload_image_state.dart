part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = _Loading;
  const factory UploadImageState.success(
      {required UploadImageResponseModel response}) = _Success;
  const factory UploadImageState.error({required ApiErrorModel error}) = _Error;
}
