part of 'get_users_number_admin_dashboard_cubit.dart';

@freezed
class GetUsersNumberAdminDashboardState with _$GetUsersNumberAdminDashboardState {
  const factory GetUsersNumberAdminDashboardState.loading() = _Loading;
  const factory GetUsersNumberAdminDashboardState.success({
    required UsersNumberModelResponse users,
  }) = _Success;
  const factory GetUsersNumberAdminDashboardState.error({
    required String message,
  }) = _Error;
}
