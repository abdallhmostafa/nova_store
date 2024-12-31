import 'package:dio/dio.dart';
import 'package:nova_store/core/api/api_error_model.dart';
import 'package:nova_store/core/api/graphql_error_model.dart';

class ErrorHandler {
  static (GraphqlErrorModel?, ApiErrorModel?) handle({
    required bool isGraphql,
    dynamic error,
  }) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return isGraphql
              ? (
                  GraphqlErrorModel(
                    errors: [
                      Error(
                        extensions: Extensions(
                          originalError: OriginalError(
                            message: error.message ?? 'Connection Timeout',
                            statusCode: 408,
                          ),
                        ),
                      ),
                    ],
                  ),
                  null
                )
              : (
                  null,
                  ApiErrorModel(
                    message: error.message ?? 'Connection Timeout',
                    statusCode: 408,
                  )
                );
        case DioExceptionType.sendTimeout:
          return isGraphql
              ? (GraphqlErrorModel(
                  errors: [
                    Error(
                      extensions: Extensions(
                        originalError: OriginalError(
                          message: error.message ?? 'Send Timeout',
                          statusCode: 408,
                        ),
                      ),
                    ),
                  ],
                ),null)
              : (null, ApiErrorModel(
                  message: error.message ?? 'Send Timeout',
                  statusCode: 408,
                ));
        case DioExceptionType.receiveTimeout:
          return isGraphql
              ? (GraphqlErrorModel(
                  errors: [
                    Error(
                      extensions: Extensions(
                        originalError: OriginalError(
                          message: error.message ?? 'Receive Timeout',
                          statusCode: 408,
                        ),
                      ),
                    ),
                  ],
                ),null)
              : (null,ApiErrorModel(
                  message: error.message ?? 'Receive Timeout',
                  statusCode: 408,
                ));
        case DioExceptionType.badResponse:
          return isGraphql
              ? (_graphqlErrorModel(error), null)
              : (null, _handleError(error.response!.data));

        case DioExceptionType.unknown:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return isGraphql
                ? (_graphqlErrorModel(error), null)
                : (null, _handleError(error.response!.data));
          } else {
            return isGraphql
                ? (_graphqlErrorModel(error), null)
                : (
                    null,
                    ApiErrorModel(
                      message: error.message ?? 'Unknown Error',
                      statusCode: 500,
                    )
                  );
          }
        case DioExceptionType.cancel:
          return isGraphql
              ? (_graphqlErrorModel(error), null)
              : (
                  null,
                  ApiErrorModel(
                    message: error.message ?? 'Request Cancelled',
                    statusCode: 500,
                  )
                );
        case DioExceptionType.connectionError:
          return isGraphql
              ? (_graphqlErrorModel(error), null)
              : (
                  null,
                  ApiErrorModel(
                    message: error.message ?? 'Connection Error',
                    statusCode: 500,
                  )
                );
        case DioExceptionType.badCertificate:
          return isGraphql
              ? (_graphqlErrorModel(error), null)
              : (
                  null,
                  ApiErrorModel(
                    message: error.message ?? 'Bad Certificate',
                    statusCode: 500,
                  )
                );
      }
    } else {
      // default error

      return isGraphql
          ? (_graphqlErrorModel(error), null)
          : (
              null,
              ApiErrorModel(
                message: 'something went wrong',
                statusCode: 500,
              )
            );
    }
  }
}

ApiErrorModel _handleError(dynamic error) {
  return ApiErrorModel(
    message: error['error'] as String?,
    statusCode: error['statusCode'] as int?,
  );
}

GraphqlErrorModel _graphqlErrorModel(dynamic error) {
  return GraphqlErrorModel.fromJson(error as Map<String, dynamic>);
}
