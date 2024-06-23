part of '../../usable_functions/api_service_helper.dart';

abstract final class ApiEndPoints {
  //#region Private variables can not be accessed

  //#region Basic Configurations

  static const String _host = 'https://newsapi.org';
  static const String _version = '$_host/v2';

  //#endregion

  //#region EndPoints
  static const String _everyThing = '/everything';
  //#endregion

  //#endregion

  //#region Getters to use them in the app
  //#region Basic Configurations
  ///Api base url
  static String get baseUrl => _version;

  //#endregion
  //#region EndPoints
  static String get everyThing => _everyThing;
//#endregion

//#endregion
}
