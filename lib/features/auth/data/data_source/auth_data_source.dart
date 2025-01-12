import 'package:dio/dio.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';
import 'package:nova_store/core/network/api_service.dart';
import 'package:nova_store/features/auth/data/model/login/login_request.dart';
import 'package:nova_store/features/auth/data/model/login/login_response.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_request_model.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_response_model.dart';
import 'package:nova_store/features/auth/data/model/user_role/user_role_response.dart';

class AuthDataSource {
  AuthDataSource({
    required this.authGraphql,
    required this.apiService,
    required this.dio,
  });
  final AuthGraphql authGraphql;
  final ApiService apiService;
  final Dio dio;

  // login
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    final response = await apiService.login(
      authGraphql.loginGraphql(loginRequest: loginRequest),
    );

    return response;
  }

  // sign up
  Future<SignUpResponseModel> signUp(
      {required SignUpRequestModel signUpRequest,}) async {
    final response = await apiService.signUp(
      authGraphql.signUpGraphql(signUpRequest: signUpRequest),
    );

    return response;
  }

  // user role
  Future<UserRoleResponse> getUserRole({required String token}) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final client = ApiService(dio);
    final response = await client.getUserRole();
    // log('Token: $token');
    return response;
  }
}
