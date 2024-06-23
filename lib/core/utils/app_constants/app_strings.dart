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




}
