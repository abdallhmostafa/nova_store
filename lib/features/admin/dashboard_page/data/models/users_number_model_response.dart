
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_number_model_response.g.dart';

@JsonSerializable(createToJson: false)
class UsersNumberModelResponse {
  UsersNumberModelResponse({
    required this.data,
  });


  factory UsersNumberModelResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberModelResponseFromJson(json);
  final Data? data;
}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.users,
  });


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  final List<User>? users;
}

@JsonSerializable(createToJson: false)
class User {
  User({
    required this.name,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final String? name;
}
