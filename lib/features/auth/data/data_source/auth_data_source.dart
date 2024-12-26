import 'package:nova_store/core/api/api_service.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';
import 'package:nova_store/features/auth/data/model/login_request.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/model/user_role_response.dart';

class AuthDataSource {
  // login
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final response = await serviceLocator<ApiService>().login(
      serviceLocator<AuthGraphql>().loginGraphql(loginRequest: loginRequest),
    );
    return response;
  }

  // user role
  Future<UserRoleResponse> getUserRole() async {
    final response = await serviceLocator<ApiService>().getUserRole();
    return response;
  }
}
