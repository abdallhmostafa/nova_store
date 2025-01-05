import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:nova_store/core/helper/secure_storage_helper.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory({required this.dio});
  final Dio dio;

  Dio getDio() {
    const timeOut = Duration(seconds: 15);

    dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut
      ..options.headers = {
        'Content-Type': 'application/json',
        // 'Accept': '*/*',
        'Authorization':
            'Bearer ${serviceLocator.get<SecureStorageHelper>().read(key: PrefKeys.accessToken)}',
      };

    debugPrint(
      "[USER Token] ====> ${serviceLocator.get<SecureStorageHelper>().read(key: PrefKeys.accessToken)}",
    );

    _addDioInterceptor();
    return dio;
  }

  void _addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        requestHeader: true,
        requestBody: true,
        // responseHeader: true,
      ),
    );
  }
}
