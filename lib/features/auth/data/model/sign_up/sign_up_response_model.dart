
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponseModel {
  SignUpResponseModel({
    required this.data,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
  final Data? data;

}

@JsonSerializable(createToJson: false)
class Data {

  Data({
    required this.addUser,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final AddUser? addUser;
}

@JsonSerializable(createToJson: false)
class AddUser {
  AddUser({
    required this.id,
    required this.name,
    required this.avatar,
  });

  factory AddUser.fromJson(Map<String, dynamic> json) =>
      _$AddUserFromJson(json);

  final String? id;
  final String? name;
  final String? avatar;
}
