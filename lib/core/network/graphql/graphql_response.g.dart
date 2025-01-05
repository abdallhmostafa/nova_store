// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphQLResponse<T> _$GraphQLResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GraphQLResponse<T>(
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errors: json['errors'] == null
          ? null
          : GraphqlErrorModel.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GraphQLResponseToJson<T>(
  GraphQLResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'errors': instance.errors,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
