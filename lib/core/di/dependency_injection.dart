import 'package:get_it/get_it.dart';
import 'package:nova_store/core/app/app_cubit/app_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerFactory(AppCubit.new);
}
