import 'package:nova_store/core/api/api_error_model.dart';
import 'package:nova_store/core/api/api_result.dart';
import 'package:nova_store/core/api/error_handler.dart';
import 'package:nova_store/core/api/graphql_error_model.dart';
import 'package:nova_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/model/user_role_response.dart';
import 'package:nova_store/features/auth/data/repos/aurh_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSource);
  final AuthDataSource _authDataSource;
  @override
  Future<ApiResult<LoginResponse>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _authDataSource.login(loginRequest: loginRequest);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle<GraphqlErrorModel>(
          isGraphql: true,
          error: e,
        ),
      );
    }
  }

  @override
  Future<ApiResult<UserRoleResponse>> getUserRole() async {
    try {
      final response = await _authDataSource.getUserRole();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle<ApiErrorModel>(
          isGraphql: false,
          error: e,
        ),
      );
    }
  }
}
