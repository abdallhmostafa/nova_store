
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_response_model.g.dart';

@JsonSerializable(createToJson: false)
class UploadImageResponseModel {
  UploadImageResponseModel({
    required this.location,
  });

  factory UploadImageResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponseModelFromJson(json);

  final String? location;
}
