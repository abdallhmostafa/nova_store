import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store/core/common/widgets/no_network_page.dart';
import 'package:nova_store/core/lang/app_localizations_setup.dart';
import 'package:nova_store/core/routes/app_routes.dart';
import 'package:nova_store/core/routes/app_routes_name.dart';
import 'package:nova_store/core/themes/app_theme.dart';
import 'package:nova_store/core/utils/connectivity_controller.dart';

class NovaStore extends StatelessWidget {
  const NovaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              builder: (context, child) => GestureDetector(
                onTap: () {
                  // FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus
                      ?.unfocus(); // to close keyboard from any where
                },
                child: Scaffold(
                  body: Builder(
                    builder: (context) {
                      ConnectivityController.instance.init();
                      return child!;
                    },
                  ),
                ),
              ),
              title: 'Nova Store',
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutesName.homePage,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.light,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
            ),
          );
        } else {
          return MaterialApp(
            title: 'Nova Store',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.light,
            home: const NoNetworkPage(),
          );
        }
      },
    );
  }
}
