import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/users_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/repos/admin_dashboard_repo_impl.dart';
part 'get_users_number_admin_dashboard_cubit.freezed.dart';
part 'get_users_number_admin_dashboard_state.dart';

class GetUsersNumberAdminDashboardCubit
    extends Cubit<GetUsersNumberAdminDashboardState> {
  GetUsersNumberAdminDashboardCubit(this._adminDashboardRepo)
      : super(const GetUsersNumberAdminDashboardState.loading());
  final AdminDashboardRepoImpl _adminDashboardRepo;
  Future<void> getUsersNumber() async {
    emit(const GetUsersNumberAdminDashboardState.loading());
    final result = await _adminDashboardRepo.getUsersNumber();
    result.when(
      success: (response) {
        emit(
          GetUsersNumberAdminDashboardState.success(
            users: response,
          ),
        );
      },
      failure: (error) {
        emit(
          GetUsersNumberAdminDashboardState.error(
            message:
                error.errors!.first.message ?? 'Oops, something went wrong',
          ),
        );
      },
    );
  }
}
