import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_store/core/api/api_service.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton(AuthGraphql.new)
    ..registerLazySingleton(
      () => ApiService(Dio()),
    )
    ..registerLazySingleton(Dio.new);
}
