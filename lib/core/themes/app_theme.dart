import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'Montserrat',
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    fontFamily: 'Montserrat',
  );
}
