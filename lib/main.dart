import 'package:flutter/material.dart';
import 'package:news_app_task/core/service_locator.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/core/utils/app_routes_utils/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServicesLocator();
  await sl<AppLanguage>().fetchLocale();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppLanguage appLanguage = sl<AppLanguage>();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appLanguage,
      builder: (context, child) {
        return MaterialApp(
          title: 'Asahl Crm',
          debugShowCheckedModeBanner: false,
          routes: AppRouter.routes,
          initialRoute: AppPathName.kNewsScreen,
          locale: appLanguage.appLocal,
          supportedLocales: AppConstants.supportedLocales.values,
          localizationsDelegates: AppConstants.delegates,
        );
      },
    );
  }
}
