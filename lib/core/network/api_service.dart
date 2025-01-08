import 'package:dio/dio.dart';
import 'package:nova_store/features/auth/data/model/login_response.dart';
import 'package:nova_store/features/auth/data/model/user_role_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String _baseUrl = 'https://api.escuelajs.co';
const String _graphql = '/graphql';
const String _api = '/api/v1';
const String _userRole = '/auth/profile';

@RestApi(baseUrl: _baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(_graphql)
  Future<LoginResponse> login(
      @Body() Map<String, dynamic> loginRequest);

  @GET(_api + _userRole)
  Future<UserRoleResponse> getUserRole();
}
