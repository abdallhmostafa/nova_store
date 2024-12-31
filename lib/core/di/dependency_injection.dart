import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nova_store/core/api/api_service.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';
import 'package:nova_store/core/graphql/auth/auth_graphql.dart';
import 'package:nova_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:nova_store/features/auth/data/repos/auth_repositoryies_impl.dart';
import 'package:nova_store/features/auth/presentation/bloc/auth_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator
    ..registerFactory(AppCubit.new)
    ..registerLazySingleton(AuthGraphql.new)
    ..registerLazySingleton(
      () => ApiService(Dio()),
    )
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton<AuthDataSource>(
      () => AuthDataSource(
        authGraphql: serviceLocator<AuthGraphql>(),
        apiService: serviceLocator<ApiService>(),
        dio: serviceLocator<Dio>(),
      ),
    )
    ..registerFactory<AuthRepositoryImpl>(
      () => AuthRepositoryImpl(serviceLocator<AuthDataSource>()),
    )
    ..registerFactory<AuthBloc>(
      () => AuthBloc(authRepository: serviceLocator<AuthRepositoryImpl>()),
    );
}
