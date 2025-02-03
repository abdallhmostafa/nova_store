import 'package:nova_store/core/network/error_handler.dart';
import 'package:nova_store/core/network/graphql/graphql_error_model.dart';
import 'package:nova_store/core/network/network_result.dart';
import 'package:nova_store/features/admin/dashboard_page/data/datasource/admin_dashboard_datasource.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/categories_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/product_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/users_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/repos/admin_dashboard_repo.dart';

class AdminDashboardRepoImpl implements AdminDashboardRepo {
  AdminDashboardRepoImpl({
    required AdminDashboardDatasource adminDashboardDataSource,
  }) : _adminDashboardDataSource = adminDashboardDataSource;

  final AdminDashboardDatasource _adminDashboardDataSource;
  @override
  Future<NetworkResult<CategoriesNumberModelResponse, GraphqlErrorModel>>
      getCategoriesNumber() async {
    try {
      final response = await _adminDashboardDataSource.getCategoriesNumber();
      if (response.data == null || response.data?.categories == null) {
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
  Future<NetworkResult<ProductNumberModelResponse, GraphqlErrorModel>>
      getProductsNumber() async {
    try {
      final response = await _adminDashboardDataSource.getProductsNumber();
      if (response.data == null || response.data?.products == null) {
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
  Future<NetworkResult<UsersNumberModelResponse, GraphqlErrorModel>>
      getUsersNumber() async {
    try {
      final response = await _adminDashboardDataSource.getUsersNumber();
      if (response.data == null || response.data?.users == null) {
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
}
