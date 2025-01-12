import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';
import 'package:nova_store/core/network/network_result.dart';
import 'package:nova_store/features/auth/data/model/login/login_request.dart';
import 'package:nova_store/features/auth/data/model/login/login_response.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_request_model.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_response_model.dart';
import 'package:nova_store/features/auth/data/model/user_role/user_role_response.dart';

abstract class AuthRepository {
  Future<NetworkResult<LoginResponse, GraphqlErrorModel>> login({
    required LoginRequest loginRequest,
  });
  Future<NetworkResult<SignUpResponseModel, GraphqlErrorModel>> signUp({
    required SignUpRequestModel signUpRequest,
  });
  Future<NetworkResult<UserRoleResponse, ApiErrorModel>> getUserRole({
    required String token,
  });
}
