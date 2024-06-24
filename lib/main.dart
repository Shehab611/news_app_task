import 'package:flutter/material.dart';
import 'package:news_app_task/core/service_locator.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/core/utils/app_routes_utils/app_router.dart';
import 'package:news_app_task/core/utils/design_utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  await sl<AppTheme>().fetchTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppLanguage appLanguage = sl<AppLanguage>();
  static final AppTheme appTheme = sl<AppTheme>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: appTheme,
        builder: (context, snapshot) {
          return ListenableBuilder(
            listenable: appLanguage,
            builder: (context, child) {
              return MaterialApp(
                title: 'Asahl Crm',
                debugShowCheckedModeBanner: false,
                routes: AppRouter.routes,
                theme: AppThemeData.defaultTheme,
                darkTheme: AppThemeData.defaultTheme,
                themeMode: appTheme.themeMode,
                initialRoute: AppPathName.kNewsScreen,
                locale: appLanguage.appLocal,
                supportedLocales: AppConstants.supportedLocales.values,
                localizationsDelegates: AppConstants.delegates,
              );
            },
          );
        });
  }
}
