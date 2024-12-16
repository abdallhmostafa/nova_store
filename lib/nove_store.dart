import 'package:flutter/material.dart';
import 'package:nova_store/core/common/widgets/no_network.dart';
import 'package:nova_store/core/themes/app_theme.dart';
import 'package:nova_store/core/utils/connectivity_controller.dart';
import 'package:nova_store/home_page.dart';

class NovaStore extends StatelessWidget {
  const NovaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            builder: (context, child) => Scaffold(
              body: Builder(
                builder: (context) {
                  ConnectivityController.instance.init();
                  return child!;
                },
              ),
            ),
            title: 'Nova Store',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            home: const HomePage(),
          );
        } else {
          return MaterialApp(
            title: 'Nova Store',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            home: const NoNetwork(),
          );
        }
      },
    );
  }
}
