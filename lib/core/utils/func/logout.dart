import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/helper/secure_storage_helper.dart';

Future<void> logout() async {
  await serviceLocator<SecureStorageHelper>().deleteAll();

}
