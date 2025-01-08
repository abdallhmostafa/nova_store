import 'package:dio/dio.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';

class ErrorHandler {
  static GraphqlErrorModel handleGraphqlError({
    required dynamic graphqlError,
  }) {
    if (graphqlError is GraphqlErrorModel) {
      if (graphqlError.errors != null && graphqlError.errors!.isNotEmpty) {
        for (final error in graphqlError.errors!) {
          final code = error.extensions?.code;
          final statusCode = error.extensions?.originalError?.statusCode;

          // Handle specific GraphQL error codes
          if (_isKnownGraphqlError(code)) {
            return _buildGraphqlErrorModel(graphqlError);
          }

          // Handle HTTP Status Codes if code is not recognized
          if (_isKnownHttpStatus(statusCode)) {
            return _buildGraphqlErrorModel(graphqlError);
          }
        }
      }

      // Default return if no specific error matched
      return _buildGraphqlErrorModel(graphqlError);
    }

    if (graphqlError is DioException) {
      return GraphqlErrorModel.fromJson(
        graphqlError.response?.data as Map<String, dynamic>? ?? {},
      );
    }

    // Unknown error fallback
    return GraphqlErrorModel(
      errors: [Error(message: null)],
    );
  }

  /// Helper method to build a GraphqlErrorModel
  static GraphqlErrorModel _buildGraphqlErrorModel(
      GraphqlErrorModel errorModel) {
    return GraphqlErrorModel(
      data: errorModel.data,
      errors: errorModel.errors,
    );
  }

  /// Known GraphQL error codes
  static bool _isKnownGraphqlError(String? code) {
    const knownGraphqlErrors = {
      'UNAUTHENTICATED',
      'BAD_USER_INPUT',
      'FORBIDDEN',
      'INTERNAL_SERVER_ERROR',
      'GRAPHQL_VALIDATION_FAILED',
    };
    return knownGraphqlErrors.contains(code);
  }

  /// Known HTTP status codes
  static bool _isKnownHttpStatus(int? statusCode) {
    const knownHttpStatusCodes = {400, 401, 403, 404, 500};
    return statusCode != null && knownHttpStatusCodes.contains(statusCode);
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
          return _handleError(error.response!.data);

        case DioExceptionType.unknown:
          if (error.response != null &&
              error.response?.statusCode != null &&
              error.response?.statusMessage != null) {
            return ApiErrorModel.fromJson(
                error.response!.data as Map<String, dynamic>);
          } else {
            return ApiErrorModel(
                message: error.message ?? 'Unknown Error', statusCode: 500);
          }
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
    message: error['message'] as String?,
    statusCode: error['statusCode'] as int?,
  );
}

// GraphqlErrorModel _graphqlErrorModel(dynamic error) {
//   return GraphqlErrorModel.fromJson(error as Map<String, dynamic>);
// }
