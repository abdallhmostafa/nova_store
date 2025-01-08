import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/error_handler.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';
import 'package:nova_store/core/network/network_result.dart';
import 'package:nova_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/model/user_role_response.dart';
import 'package:nova_store/features/auth/data/repos/aurh_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSource);
  final AuthDataSource _authDataSource;
  @override
  Future<NetworkResult<LoginResponse, GraphqlErrorModel>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _authDataSource.login(loginRequest: loginRequest);
      if (response.data == null || response.data?.login == null) {
        return NetworkResult.failure(
          error: ErrorHandler.handleGraphqlError(
            graphqlError: 'Oops, something went wrong',
          ),
        );
      }

      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(
        error: ErrorHandler.handleGraphqlError(
          graphqlError: e,
        ),
      );
    }
  }

  @override
  Future<NetworkResult<UserRoleResponse, ApiErrorModel>> getUserRole({
    required String token,
  }) async {
    try {
      final response = await _authDataSource.getUserRole(token: token);
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(
        error: ErrorHandler.handleApiError(error: e),
      );
    }
  }
}
