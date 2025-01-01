import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nova_store/core/services/shared_pref/pref_keys.dart';
import 'package:nova_store/core/services/shared_pref/shared_pref.dart';
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
        'Authorization': 'Bearer ${SharedPref.getString(PrefKeys.accessToken)}',
      };

    debugPrint(
      "[USER Token] ====> ${SharedPref.getString(PrefKeys.accessToken) ?? 'NULL TOKEN'}",
    );

    addDioInterceptor();
    return dio;
  }

  void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        compact: false,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
    );
  }
}

// abstract class DioFactory {
//   DioFactory._();

//   static Dio? dio;

//   static Dio getDio() {
//     const timeOut = Duration(seconds: 15);

//     if (dio == null) {
//       dio = Dio();
//       dio!
//         ..options.connectTimeout = timeOut
//         ..options.receiveTimeout = timeOut

//         ..options.headers = {
//           'Content-Type': 'application/json',
//           // 'Accept': '*/*',
//           'Authorization':
//               'Bearer ${SharedPref.getString(PrefKeys.accessToken)}',
//         };

//       debugPrint(
//         "[USER Token] ====> ${SharedPref.getString(PrefKeys.accessToken) ?? 'NULL TOKEN'}",
//       );

//       addDioInterceptor();
//       return dio!;
//     } else {
//       return dio!;
//     }
//   }

//   static void addDioInterceptor() {
//     dio?.interceptors.add(
//       PrettyDioLogger(
//           request: true,
//           compact: false,
//           requestHeader: true,
//           responseHeader: true,
//           requestBody: true,

//           ),
//     );
//   }
// }
