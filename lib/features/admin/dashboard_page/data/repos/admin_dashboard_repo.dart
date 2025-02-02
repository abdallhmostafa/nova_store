import 'package:nova_store/core/network/graphql/graphql_error_model.dart';
import 'package:nova_store/core/network/network_result.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/categories_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/product_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/users_number_model_response.dart';

abstract class AdminDashboardRepo {
  Future<NetworkResult<CategoriesNumberModelResponse, GraphqlErrorModel>>
      getCategoriesNumber();
  Future<NetworkResult<ProductNumberModelResponse, GraphqlErrorModel>>
      getProductsNumber();
  Future<NetworkResult<UsersNumberModelResponse, GraphqlErrorModel>>
      getUsersNumber();
}
