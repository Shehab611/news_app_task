part of '../../usable_functions/api_service_helper.dart';

final class ApiResponse {
  final Response? response;
  final int? statusCode;
  final dynamic error;

  const ApiResponse(this.response, this.error, this.statusCode);

  const ApiResponse.withError(dynamic errorValue, [int? statusC])
      : response = null,
        statusCode = statusC,
        error = errorValue;

  ApiResponse.withSuccess(Response responseValue)
      : response = responseValue,
        statusCode = responseValue.statusCode,
        error = null;
}
