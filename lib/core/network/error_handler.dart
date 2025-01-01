import 'package:dio/dio.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';

class ErrorHandler {
  static GraphqlErrorModel handleGraphqlError({
    required GraphqlErrorModel graphqlError,
  }) {
    if (graphqlError.errors != null && graphqlError.errors!.isNotEmpty) {
      for (final error in graphqlError.errors!) {
        // Handle specific error codes
        switch (error.extensions?.code) {
          case 'UNAUTHENTICATED':
            return GraphqlErrorModel(
              data: graphqlError.data,
              errors: graphqlError.errors,
            );
          // Redirect to login screen or show error message

          case 'BAD_USER_INPUT':
            return GraphqlErrorModel(
              data: graphqlError.data,
              errors: graphqlError.errors,
            );
          // Highlight incorrect fields in UI

          case 'FORBIDDEN':
            return GraphqlErrorModel(
              data: graphqlError.data,
              errors: graphqlError.errors,
            );
          // Show access denied message

          case 'INTERNAL_SERVER_ERROR':
            return GraphqlErrorModel(
              data: graphqlError.data,
              errors: graphqlError.errors,
            );
          // Display server error notification

          case 'GRAPHQL_VALIDATION_FAILED':
            return GraphqlErrorModel(
              data: graphqlError.data,
              errors: graphqlError.errors,
            );
          // Log validation issues

          default:
           // Handle HTTP Status Codes (if present)
            if (error.extensions?.originalError?.statusCode != null) {
              switch (error.extensions!.originalError!.statusCode) {
                case 400:
                        return GraphqlErrorModel(
                      data: graphqlError.data,
                      errors: graphqlError.errors,
                    );
                case 401:
                  return GraphqlErrorModel(
                    data: graphqlError.data,
                    errors: graphqlError.errors,
                  );
                case 403:
                  return GraphqlErrorModel(
                    data: graphqlError.data,
                    errors: graphqlError.errors,
                  );
                case 404:
                  return GraphqlErrorModel(
                    data: graphqlError.data,
                    errors: graphqlError.errors,
                  );
                case 500:
                  return GraphqlErrorModel(
                    data: graphqlError.data,
                    errors: graphqlError.errors,
                  );
                default:
                  return GraphqlErrorModel(
                    data: graphqlError.data,
                    errors: graphqlError.errors,
                  );
              }
            }
          // Handle unknown errors
        }
        

      
      }
    } else {
      return GraphqlErrorModel(
        data: graphqlError.data,
        errors: graphqlError.errors,
      );
    }
    return GraphqlErrorModel(
        data: graphqlError.data,
        errors: graphqlError.errors,
      );
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
  return ApiErrorModel.fromJson(error as Map<String, dynamic>);
}

GraphqlErrorModel _graphqlErrorModel(dynamic error) {
  return GraphqlErrorModel.fromJson(error as Map<String, dynamic>);
}
