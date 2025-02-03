// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_number_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersNumberModelResponse _$UsersNumberModelResponseFromJson(
        Map<String, dynamic> json) =>
    UsersNumberModelResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String?,
    );
