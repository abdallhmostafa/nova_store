import 'package:nova_store/core/graphql/admin/admin_graphql.dart';
import 'package:nova_store/core/network/api_service.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/categories_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/product_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/users_number_model_response.dart';

class AdminDashboardDatasource {
  AdminDashboardDatasource({
    required this.adminGraphql,
    required this.apiService,
  });
  final AdminGraphql adminGraphql;
  final ApiService apiService;
  Future<ProductNumberModelResponse> getProductsNumber() async {
    final response = await apiService.getProductsNumber(
      adminGraphql.getProductsNumberGraphql(),
    );
    return response;
  }

  Future<UsersNumberModelResponse> getUsersNumber() async {
    final response = await apiService.getUsersNumber(
      adminGraphql.getUsersNumber(),
    );
    return response;
  }

  Future<CategoriesNumberModelResponse> getCategoriesNumber() async {
    final response = await apiService.getCategoriesNumber(
      adminGraphql.getCategoriesNumberGraphql(),
    );
    return response;
  }
}
