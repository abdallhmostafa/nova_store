import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/app/upload_image/model/upload_image_response_model.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(const UploadImageState.initial());
}
