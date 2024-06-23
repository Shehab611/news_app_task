part of '../../usable_functions/api_service_helper.dart';

class ErrorResponse {
  final bool status;
  final String message;

  ErrorResponse(this.status, this.message);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(json['status'], json['message']);
  }
}
