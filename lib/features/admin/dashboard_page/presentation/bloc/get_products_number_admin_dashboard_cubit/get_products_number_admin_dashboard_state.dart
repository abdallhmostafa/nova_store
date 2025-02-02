part of 'get_products_number_admin_dashboard_cubit.dart';

@freezed
class GetProductsNumberAdminDashboardState
    with _$GetProductsNumberAdminDashboardState {
  const factory GetProductsNumberAdminDashboardState.loading() = _Loading;
  const factory GetProductsNumberAdminDashboardState.success({
    required ProductNumberModelResponse products,
  }) = _Success;
  const factory GetProductsNumberAdminDashboardState.error({
    required String message,
  }) = _Error;
}
