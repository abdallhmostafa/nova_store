part of 'get_categories_number_admin_dashboard_cubit.dart';

@freezed
class GetCategoriesNumberAdminDashboardState
    with _$GetCategoriesNumberAdminDashboardState {
  const factory GetCategoriesNumberAdminDashboardState.loading() = _Loading;
  const factory GetCategoriesNumberAdminDashboardState.success({
    required CategoriesNumberModelResponse categories,
  }) = _Success;
  const factory GetCategoriesNumberAdminDashboardState.error({
    required String message,
  }) = _Error;
}
