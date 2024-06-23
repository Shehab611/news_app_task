part of '../../usable_functions/api_service_helper.dart';

abstract final class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = AppStrings.requestCancelled;
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = AppStrings.connectionTimeOut;
              break;
            case DioExceptionType.connectionError:
              errorDescription = AppStrings.internetConnectionError;
              break;
            case DioExceptionType.receiveTimeout:
              errorDescription = AppStrings.receiveTimeOut;
              break;
            case DioExceptionType.badResponse:
              if (error.response!.statusCode! < 500 &&
                  error.response!.statusCode! > 399) {
                errorDescription = ErrorResponse.fromJson(error.response!.data);
              } else {
                errorDescription = error.response!.data;
              }
            case DioExceptionType.sendTimeout:
              errorDescription = AppStrings.sendTimeOut;
            case DioExceptionType.badCertificate:
              errorDescription = AppStrings.badCertificatesError;
            case DioExceptionType.unknown:
              errorDescription = AppStrings.unknownError;
          }
        } else {
          errorDescription = AppStrings.unexpectedError;
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}

abstract final class ApiChecker {
  static String checkApi(ApiResponse apiResponse, BuildContext context) {
    if (apiResponse.error is String) {
      String errorResponse = apiResponse.error;
      return AppLocalizations.of(context).translate(errorResponse);
    } else if (apiResponse.error is ErrorResponse) {
      ErrorResponse errorResponse = apiResponse.error as ErrorResponse;
      String translatedText = '';
      switch (errorResponse.errorCode) {
        case AppStrings.apiKeyDisabled:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.apiKeyDisabledMessage);
        case AppStrings.apiKeyExhausted:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.apiKeyExhaustedMessage);
        case AppStrings.apiKeyInvalid:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.apiKeyInvalidMessage);
        case AppStrings.apiKeyMissing:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.apiKeyMissingMessage);
        case AppStrings.parameterInvalid:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.parameterInvalidMessage);
        case AppStrings.parameterMissing:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.parameterMissingMessage);
        case AppStrings.rateLimited:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.rateLimitedMessage);
        case AppStrings.sourcesTooMany:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.sourcesTooManyMessage);
        case AppStrings.sourceDoesNotExist:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.sourceDoesNotExistMessage);
        case AppStrings.unexpectedErrorApi:
          translatedText = AppLocalizations.of(context)
              .translate(AppStrings.unexpectedErrorApiMessage);
      }
      return translatedText;
    } else {
      if (kDebugMode) {
        print('Error badResponse can not handled');
      }
      return 'Error badResponse can not handled';
    }
  }
}
