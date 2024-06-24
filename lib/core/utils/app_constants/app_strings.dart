import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_constants.dart';

part 'app_localization.dart';

abstract final class AppStrings {
  //#region App default texts
  static const String noData = 'no_data';
  static const String en = 'en';
  static const String ar = 'ar';
  static const String newsScreen = 'news_screen';

  //#endregion

  //#region Network keys
  static const String noConnection = 'no_connection';
  static const String connected = 'connected';
  static const String requestCancelled = 'request_cancelled';
  static const String connectionTimeOut = 'connection_time_out';
  static const String receiveTimeOut = 'receive_time_out';
  static const String sendTimeOut = 'send_time_out';
  static const String internetConnectionError = 'internet_connection_error';
  static const String badCertificatesError = 'bad_certificates_error';
  static const String unknownError = 'unknown_error';
  static const String unexpectedError = 'unexpected_error';

  //#endregion

  //#region Api Error Codes
  static const String apiKeyDisabled = 'apiKeyDisabled';
  static const String apiKeyExhausted = 'apiKeyExhausted';
  static const String apiKeyInvalid = 'apiKeyInvalid';
  static const String apiKeyMissing = 'apiKeyMissing';
  static const String parameterInvalid = 'parameterInvalid';
  static const String parameterMissing = 'parameterMissing';
  static const String rateLimited = 'rateLimited';
  static const String sourcesTooMany = 'sourcesTooMany';
  static const String sourceDoesNotExist = 'sourceDoesNotExist';
  static const String unexpectedErrorApi = 'unexpectedError';
//#endregion

//#region Api Error Messages
  static const String apiKeyDisabledMessage = 'apiKeyDisabledMessage';
  static const String apiKeyExhaustedMessage = 'apiKeyExhaustedMessage';
  static const String apiKeyInvalidMessage = 'apiKeyInvalidMessage';
  static const String apiKeyMissingMessage = 'apiKeyMissingMessage';
  static const String parameterInvalidMessage = 'parameterInvalidMessage';
  static const String parameterMissingMessage = 'parameterMissingMessage';
  static const String rateLimitedMessage = 'rateLimitedMessage';
  static const String sourcesTooManyMessage = 'sourcesTooManyMessage';
  static const String sourceDoesNotExistMessage = 'sourceDoesNotExistMessage';
  static const String unexpectedErrorApiMessage= 'unexpectedErrorMessage';
//#endregion
}
