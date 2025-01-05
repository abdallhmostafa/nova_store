import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nova_store/core/routes/routes_name.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';

class SecureStorageHelper {
  SecureStorageHelper(this._storage);
  // Create an instance of FlutterSecureStorage
  final  FlutterSecureStorage _storage;

Future<String> initialRoute() async {
    return await _storage.read(key: PrefKeys.accessToken) !=
            null
        ? await read(key: PrefKeys.userRole) ==
                'admin'
            ? RoutesName.adminHomePage
            : RoutesName.clientHomePage
        : RoutesName.loginPage;
  }
  // Save a value to secure storage
  Future<void> save({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  // Read a value from secure storage
  Future<String?> read({required String key}) async {
    return   _storage.read(key: key);
  }

  // Check if a key exists in secure storage
  Future<bool> containsKey({required String key}) async {
    return _storage.containsKey(key: key);
  }

  // Delete a value from secure storage
  Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  // Delete all values from secure storage
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  // Read all key-value pairs from secure storage
  Future<Map<String, String>> readAll() async {
    return _storage.readAll();
  }
}
