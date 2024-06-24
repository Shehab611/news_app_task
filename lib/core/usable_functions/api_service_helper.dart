import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';

part '../utils/api_utils/api_endpoints.dart';

part '../utils/api_utils/api_error_handler.dart';

part '../utils/api_utils/api_error_response.dart';

part '../utils/api_utils/api_response.dart';

part 'logging_interceptor.dart';

class DioClient {
  final String _baseUrl;
  final LoggingInterceptor _loggingInterceptor;
  final Dio _dio;

  DioClient(
    this._baseUrl,
    this._dio, {
    required LoggingInterceptor loggingInterceptor,
  }) : _loggingInterceptor = loggingInterceptor {
    _dio
      ..options.baseUrl = _baseUrl
      ..options.connectTimeout = AppConstants.connectionTimeOut
      ..options.receiveTimeout = AppConstants.connectionTimeOut
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${AppConstants.apiKey}',
        'Accept': 'application/json',
      };
    _dio.interceptors.add(_loggingInterceptor);
  }

  Future<Response> get(
    String uri,
    StackTrace stackTrace, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _getFilePath(stackTrace);
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri,
    StackTrace stackTrace, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _getFilePath(stackTrace);

    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  void _getFilePath(StackTrace stackTrace) {
    String filePath = 'Unknown file';
    List<String> traceLines = stackTrace.toString().split('\n');

    // Find the first line that doesn't contain Dio package
    for (String line in traceLines) {
      if (!line.contains('package:dio')) {
        filePath = line.trim();
        break;
      }
    }

    if (kDebugMode) {
      print("Request initiated from =>: $filePath");
    }
  }
}
