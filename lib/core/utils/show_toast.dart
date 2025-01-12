import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

final class ShowToast {
  const ShowToast._();

  static void showToastError({
    required String message,
    int? seconds,
    ToastGravity gravity = ToastGravity.TOP,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.sp,
      );

  static void showToastLoading({
    String message = 'Loading...',
    int? seconds,
    ToastGravity gravity = ToastGravity.TOP,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.sp,
      );

  static void showToastSuccess({
    required String message,
    int? seconds,
    ToastGravity gravity = ToastGravity.TOP,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: gravity,
        timeInSecForIosWeb: seconds ?? 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.sp,
      );
}
