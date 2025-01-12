import 'package:nova_store/core/network/graphql/graphql_error_model.dart';

class GraphQLResponse<T> {
  GraphQLResponse({this.data, this.errors});
  factory GraphQLResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return GraphQLResponse(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => GraphqlErrorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  final T? data;
  final List<GraphqlErrorModel>? errors;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'data': data != null ? toJsonT(data as T) : null,
      'errors': errors?.map((e) => e.toJson()).toList(),
    };
  }
}
