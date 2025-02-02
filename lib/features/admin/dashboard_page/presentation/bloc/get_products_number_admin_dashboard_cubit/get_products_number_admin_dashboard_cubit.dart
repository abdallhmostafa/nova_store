import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_store/features/admin/dashboard_page/data/models/product_number_model_response.dart';
import 'package:nova_store/features/admin/dashboard_page/data/repos/admin_dashboard_repo_impl.dart';
part 'get_products_number_admin_dashboard_cubit.freezed.dart';
part 'get_products_number_admin_dashboard_state.dart';

class GetProductsNumberAdminDashboardCubit
    extends Cubit<GetProductsNumberAdminDashboardState> {
  GetProductsNumberAdminDashboardCubit(this._adminDashboardRepo)
      : super(const GetProductsNumberAdminDashboardState.loading());
  final AdminDashboardRepoImpl _adminDashboardRepo;

  Future<void> getProductsNumber() async {
    emit(const GetProductsNumberAdminDashboardState.loading());
    final result = await _adminDashboardRepo.getProductsNumber();
    result.when(
      success: (response) {
        emit(
          GetProductsNumberAdminDashboardState.success(
            products: response,
          ),
        );
      },
      failure: (error) {
        emit(
          GetProductsNumberAdminDashboardState.error(
            message:
                error.errors!.first.message ?? 'Oops, something went wrong',
          ),
        );
      },
    );
  }
}
