part of 'app_strings.dart';

final class AppLocalizations {
  final Locale locale;

  AppLocalizations({required this.locale});

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    //error in loading the string
    String jsonString = await rootBundle
        .loadString('assets/localizations/${locale.languageCode}.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return _localizedStrings![key]!;
  }
}

final class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return AppConstants.supportedLocales.containsValue(locale);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

final class AppLanguage extends ChangeNotifier {
  Locale _appLocale =
      AppConstants.supportedLocales[AppConstants.defaultLanguage]!;

  Locale get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale(AppConstants.defaultLanguage);
      await prefs.setString('language_code', AppConstants.defaultLanguage);
    } else {
      _appLocale = Locale(prefs.getString('language_code')!);
    }
  }

//call this to change language
  void changeLanguage(Locale locale) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == locale) {
      return;
    } else {
      _appLocale = locale;
      await prefs.setString('language_code', locale.languageCode);
    }
    notifyListeners();
  }
}
