import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/categories_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/repos/admin_dashboard_repo_impl.dart';
part 'get_categories_number_admin_dashboard_cubit.freezed.dart';
part 'get_categories_number_admin_dashboard_state.dart';

class GetCategoriesNumberAdminDashboardCubit
    extends Cubit<GetCategoriesNumberAdminDashboardState> {
  GetCategoriesNumberAdminDashboardCubit(this._adminDashboardRepo)
      : super(const GetCategoriesNumberAdminDashboardState.loading());
  final AdminDashboardRepoImpl _adminDashboardRepo;
  Future<void> getCategoriesNumber() async {
    emit(const GetCategoriesNumberAdminDashboardState.loading());
    final result = await _adminDashboardRepo.getCategoriesNumber();
    result.when(
      success: (response) {
        emit(
          GetCategoriesNumberAdminDashboardState.success(
            categories: response,
          ),
        );
      },
      failure: (error) {
        emit(
          GetCategoriesNumberAdminDashboardState.error(
            message:
                error.errors!.first.message ?? 'Oops, something went wrong',
          ),
        );
      },
    );
  }
}
