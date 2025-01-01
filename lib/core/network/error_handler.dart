import 'package:dio/dio.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';

class ErrorHandler {
  static GraphqlErrorModel handleGraphqlError({
    dynamic error,
  }) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return GraphqlErrorModel(
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
          );

        case DioExceptionType.sendTimeout:
          return GraphqlErrorModel(
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
          );
        case DioExceptionType.receiveTimeout:
          return GraphqlErrorModel(
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
          );
        case DioExceptionType.badResponse:
          return _graphqlErrorModel(error);

        case DioExceptionType.unknown:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return _graphqlErrorModel(error);
          } else {
            return GraphqlErrorModel(
              errors: [
                Error(
                  extensions: Extensions(
                    originalError: OriginalError(
                      message: error.message ?? 'Unknown Error',
                      statusCode: 500,
                    ),
                  ),
                ),
              ],
            );
          }
        case DioExceptionType.cancel:
          return GraphqlErrorModel(
            errors: [
              Error(
                extensions: Extensions(
                  originalError: OriginalError(
                    message: error.message ?? 'Request Cancelled',
                    statusCode: 500,
                  ),
                ),
              ),
            ],
          );
        case DioExceptionType.connectionError:
          return GraphqlErrorModel(
            errors: [
              Error(
                extensions: Extensions(
                  originalError: OriginalError(
                    message: error.message ?? 'Connection Error',
                    statusCode: 500,
                  ),
                ),
              ),
            ],
          );
        case DioExceptionType.badCertificate:
          return GraphqlErrorModel(
            errors: [
              Error(
                extensions: Extensions(
                  originalError: OriginalError(
                    message: error.message ?? 'Bad Certificate',
                    statusCode: 500,
                  ),
                ),
              ),
            ],
          );
      }
    } else {
      // default error

      return _graphqlErrorModel(error);   
    }
  }

  static ApiErrorModel handleApiError({
    dynamic error,
  }) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: error.message ?? 'Connection Timeout',
            statusCode: 408,
          );
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: error.message ?? 'Send Timeout',
            statusCode: 408,
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: error.message ?? 'Receive Timeout',
            statusCode: 408,
          );
        case DioExceptionType.badResponse:
          return _handleError(error);
        case DioExceptionType.unknown:
          return _handleError(error);
        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: error.message ?? 'Request Cancelled',
            statusCode: 500,
          );
        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: error.message ?? 'Connection Error',
            statusCode: 500,
          );
        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            message: error.message ?? 'Bad Certificate',
            statusCode: 500,
          );
      }
    } else {
      // d  efault error
      return ApiErrorModel(
        message: 'something went wrong',
        statusCode: 500,
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
