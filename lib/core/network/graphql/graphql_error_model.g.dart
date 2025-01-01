// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphqlErrorModel _$GraphqlErrorModelFromJson(Map<String, dynamic> json) =>
    GraphqlErrorModel(
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      data: json['data'],
    );

Map<String, dynamic> _$GraphqlErrorModelToJson(GraphqlErrorModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      message: json['message'] as String?,
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: (json['path'] as List<dynamic>?)?.map((e) => e as String).toList(),
      extensions: json['extensions'] == null
          ? null
          : Extensions.fromJson(json['extensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'message': instance.message,
      'locations': instance.locations,
      'path': instance.path,
      'extensions': instance.extensions,
    };

Extensions _$ExtensionsFromJson(Map<String, dynamic> json) => Extensions(
      originalError: json['originalError'] == null
          ? null
          : OriginalError.fromJson(
              json['originalError'] as Map<String, dynamic>),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ExtensionsToJson(Extensions instance) =>
    <String, dynamic>{
      'code': instance.code,
      'originalError': instance.originalError,
    };

OriginalError _$OriginalErrorFromJson(Map<String, dynamic> json) =>
    OriginalError(
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OriginalErrorToJson(OriginalError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      line: (json['line'] as num?)?.toInt(),
      column: (json['column'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'line': instance.line,
      'column': instance.column,
    };
