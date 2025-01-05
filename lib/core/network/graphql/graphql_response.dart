import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';

part 'graphql_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GraphQLResponse<T> {
  final T? data; // Nullable to handle error responses
  final GraphqlErrorModel? errors;

  GraphQLResponse({this.data, this.errors});

  factory GraphQLResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$GraphQLResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$GraphQLResponseToJson(this, toJsonT);
}
