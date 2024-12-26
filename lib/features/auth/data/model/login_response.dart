import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({required this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  final Data? data;

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.login,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  final Login? login;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Login {
  Login({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
