import 'package:freezed_annotation/freezed_annotation.dart';

part 'graphql_error_model.g.dart';
@JsonSerializable()
class GraphqlErrorModel {
  GraphqlErrorModel({
    required this.errors,
     this.data,
  });

  factory GraphqlErrorModel.fromJson(Map<String, dynamic> json) =>
      _$GraphqlErrorModelFromJson(json);

  final List<Error>? errors;
  final dynamic data;

  Map<String, dynamic> toJson() => _$GraphqlErrorModelToJson(this);
}

@JsonSerializable()
class Error {
  Error({
     this.message,
     this.locations,
     this.path,
     this.extensions,
  });

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  final String? message;
  final List<Location>? locations;
  final List<String>? path;
  final Extensions? extensions;

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class Extensions {
  Extensions({
     required this.originalError, this.code,
  });

  factory Extensions.fromJson(Map<String, dynamic> json) =>
      _$ExtensionsFromJson(json);

  final String? code;
  final OriginalError? originalError;

  Map<String, dynamic> toJson() => _$ExtensionsToJson(this);
}

@JsonSerializable()
class OriginalError {
  OriginalError({
    required this.message,
    required this.statusCode,
  });

  factory OriginalError.fromJson(Map<String, dynamic> json) =>
      _$OriginalErrorFromJson(json);

  final String? message;
  final int? statusCode;

  Map<String, dynamic> toJson() => _$OriginalErrorToJson(this);
}

@JsonSerializable()
class Location {
  Location({
    required this.line,
    required this.column,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  final int? line;
  final int? column;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
