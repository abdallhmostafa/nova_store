import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';
import 'package:nova_store/core/helper/secure_storage_helper.dart';
import 'package:nova_store/core/network/api_service.dart';
import 'package:nova_store/core/network/dio_factory.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';
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
}
