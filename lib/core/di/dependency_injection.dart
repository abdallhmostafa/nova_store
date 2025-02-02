import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';
import 'package:nova_store/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:nova_store/core/app/upload_image/datasource/upload_image_datasource.dart';
import 'package:nova_store/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:nova_store/core/graphql/admin/admin_graphql.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';
import 'package:nova_store/core/helper/secure_storage_helper.dart';
import 'package:nova_store/core/network/api_service.dart';
import 'package:nova_store/core/network/dio_factory.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';
import 'package:nova_store/features/admin/dashboard_page/data/datasource/admin_dashboard_datasource.dart';
import 'package:nova_store/features/admin/dashboard_page/data/repos/admin_dashboard_repo_impl.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_categories_number_admin_dashboard_cubit/get_categories_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_products_number_admin_dashboard_cubit/get_products_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/admin/dashboard_page/presentation/bloc/get_users_number_admin_dashboard_cubit/get_users_number_admin_dashboard_cubit.dart';
import 'package:nova_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:nova_store/features/auth/data/repos/auth_repositoryies_impl.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  final navigatorKey = GlobalKey<NavigatorState>();
  serviceLocator
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton(AuthGraphql.new)
    ..registerLazySingleton(
      () => ApiService(DioFactory(dio: Dio()).getDio()),
    )
    ..registerSingleton(DioFactory(dio: Dio()))
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(
        authGraphql: serviceLocator<AuthGraphql>(),
        apiService: serviceLocator<ApiService>(),
        dio: serviceLocator<DioFactory>().getDio(),
      ),
    )
    ..registerFactory<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(serviceLocator<AuthDataSource>()),
    )
    ..registerFactory<AuthBloc>(
      () => AuthBloc(authRepositoryImpl: serviceLocator<AuthRepositoryImpl>()),
    )
    ..registerLazySingleton<SharedPreferences>(
      () => SharedPref.sharedPreferences,
    )
    ..registerLazySingleton<SecureStorageHelper>(
      () => SecureStorageHelper(const FlutterSecureStorage()),
    )
    ..registerSingleton<GlobalKey<NavigatorState>>(
      navigatorKey,
    );

  _uploadImageService();
  _admin();
}

Future<void> _uploadImageService() async {
  serviceLocator
    ..registerLazySingleton<UploadImageDatasource>(
      () => UploadImageDatasource(serviceLocator<ApiService>()),
    )
    ..registerLazySingleton<UploadImageRepo>(
      () => UploadImageRepo(serviceLocator<UploadImageDatasource>()),
    )
    ..registerFactory<UploadImageCubit>(
      () => UploadImageCubit(serviceLocator<UploadImageRepo>()),
    );
}

Future<void> _admin() async {
  serviceLocator
    ..registerLazySingleton<AdminGraphql>(
      AdminGraphql.new,
    )
    ..registerLazySingleton<AdminDashboardDatasource>(
      () => AdminDashboardDatasource(
        adminGraphql: serviceLocator<AdminGraphql>(),
        apiService: serviceLocator<ApiService>(),
      ),
    )
    ..registerLazySingleton<AdminDashboardRepoImpl>(
      () => AdminDashboardRepoImpl(
        adminDashboardDataSource: serviceLocator<AdminDashboardDatasource>(),
      ),
    );
    _adminDashboardCubits();
}

void _adminDashboardCubits() {
  serviceLocator
    ..registerFactory<GetCategoriesNumberAdminDashboardCubit>(
      () => GetCategoriesNumberAdminDashboardCubit(
        serviceLocator<AdminDashboardRepoImpl>(),
      ),
    )
    ..registerFactory<GetProductsNumberAdminDashboardCubit>(
      () => GetProductsNumberAdminDashboardCubit(
        serviceLocator<AdminDashboardRepoImpl>(),
      ),
    )
    ..registerFactory<GetUsersNumberAdminDashboardCubit>(
      () => GetUsersNumberAdminDashboardCubit(
        serviceLocator<AdminDashboardRepoImpl>(),
      ),
    );
}
