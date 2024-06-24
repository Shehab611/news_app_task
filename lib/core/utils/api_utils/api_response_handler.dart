part of '../../usable_functions/api_service_helper.dart';

final class ApiResponseHandler {
  final DioClient _dioClient;

  const ApiResponseHandler(this._dioClient);

  Future<ApiResponse> handleGetApiResponse(String endPoint,
      [Map<String, dynamic>? query]) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      final response =
          await _dioClient.get(endPoint, stackTrace, queryParameters: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
          ApiChecker.checkApi(ApiErrorHandler.getMessage(e)));
    }
  }

  Future<ApiResponse> handlePostApiResponse(String endPoint,
      [Map<String, dynamic>? query, dynamic data]) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      final response = await _dioClient.post(endPoint, stackTrace,
          data: data, queryParameters: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
          ApiChecker.checkApi(ApiErrorHandler.getMessage(e)));
    }
  }

  Future<ApiResponse> handlePutApiResponse(String endPoint,
      [Map<String, dynamic>? query, dynamic data]) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      final response = await _dioClient.put(endPoint, stackTrace,
          data: data, queryParameters: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
          ApiChecker.checkApi(ApiErrorHandler.getMessage(e)));
    }
  }

  Future<ApiResponse> handleDeleteApiResponse(String endPoint,
      [Map<String, dynamic>? query, dynamic data]) async {
    try {
      StackTrace stackTrace = StackTrace.current;
      final response = await _dioClient.delete(endPoint, stackTrace,
          data: data, queryParameters: query);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
          ApiChecker.checkApi(ApiErrorHandler.getMessage(e)));
    }
  }
}
