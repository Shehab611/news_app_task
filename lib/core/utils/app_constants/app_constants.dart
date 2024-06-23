part of 'app_strings.dart';

abstract final class AppConstants {
  //#region private variables
  static const Duration _connectionTimeOut = Duration(seconds: 30000);

  //#region Localization Private Variables
  static const String _defaultLanguage = 'en';

  static const List<LocalizationsDelegate> _delegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const Map<String, Locale> _supportedLocales = {
    'en': Locale('en', ''),
    'ar': Locale('ar', ''),
  };

  //#endregion

  //#endregion

  //#region getters
  static Duration get connectionTimeOut => _connectionTimeOut;

  //#region Localization Getters
  static String get defaultLanguage => _defaultLanguage;

  static Map<String, Locale> get supportedLocales => _supportedLocales;

  static List<LocalizationsDelegate> get delegates => _delegates;

  //#endregion

  //#endregion

}
