import 'package:nova_store/core/api/api_result.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/model/user_role_response.dart';

abstract class AuthRepository {
  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest});
  Future<ApiResult<UserRoleResponse>> getUserRole();
}
