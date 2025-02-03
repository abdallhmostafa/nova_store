import 'package:dio/dio.dart';
import 'package:nova_store/core/app/upload_image/model/upload_image_response_model.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/categories_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/product_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/users_number_model_response.dart';
import 'package:nova_store/features/auth/data/model/login/login_response.dart';
import 'package:nova_store/features/auth/data/model/sign_up/sign_up_response_model.dart';
import 'package:nova_store/features/auth/data/model/user_role/user_role_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

const String _baseUrl = 'https://api.escuelajs.co';
const String _graphql = '/graphql';
const String _api = '/api/v1';
const String _userRole = '/auth/profile';
const String _uploadImage = '/files/upload';

@RestApi(baseUrl: _baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(_graphql)
  Future<LoginResponse> login(@Body() Map<String, dynamic> loginRequest);

  @POST(_graphql)
  Future<SignUpResponseModel> signUp(
    @Body() Map<String, dynamic> signUpRequest,
  );

  @GET(_api + _userRole)
  Future<UserRoleResponse> getUserRole();

  @POST(_api + _uploadImage)
  Future<UploadImageResponseModel> uploadImage(@Body() FormData file);

  @POST(_graphql)
  Future<ProductNumberModelResponse> getProductsNumber(
    @Body() Map<String, dynamic> productsNumberRequest,
  );

  @POST(_graphql)
  Future<CategoriesNumberModelResponse> getCategoriesNumber(
    @Body() Map<String, dynamic> categoriesNumberRequest,
  );
  @POST(_graphql)
  Future<UsersNumberModelResponse> getUsersNumber(
    @Body() Map<String, dynamic> usersNumberRequest,
  );
}
