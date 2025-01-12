part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = Loading;
  const factory UploadImageState.success(
      {required UploadImageResponseModel response}) = Success;
  const factory UploadImageState.remove({required String url}) = Remove;
  const factory UploadImageState.error({required ApiErrorModel error}) = Error;
}
