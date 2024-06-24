import 'package:flutter/material.dart';
import 'package:news_app_task/core/usable_functions/api_service_helper.dart';
import 'package:news_app_task/features/news/data/models/article_model.dart';

abstract interface class ArticleRemoteDataSourceInterface {
  Future<List<ArticleModel>> getBusinessArticles(
      Map<String, dynamic> query, BuildContext context);
}

final class ArticleRemoteDataSourceImpl
    implements ArticleRemoteDataSourceInterface {
  final DioClient _dioClient;

  const ArticleRemoteDataSourceImpl(this._dioClient);

  //#region Private Methods
  Future<ApiResponse> _handleApiResponse(
      String endPoint, Map<String, dynamic> query) async {
    ApiResponse apiResponse;
    try {
      StackTrace stackTrace = StackTrace.current;
      final response =
          await _dioClient.get(endPoint, stackTrace, queryParameters: query);
      apiResponse = ApiResponse.withSuccess(response);
    } catch (e) {
      apiResponse = ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
    return apiResponse;
  }

  List<ArticleModel> _getArticles(ApiResponse apiResponse) {
    final List<ArticleModel> articles = [];
    for (var json in apiResponse.response!.data['articles']) {
      articles.add(ArticleModel.fromJson(json));
    }
    return articles;
  }

//#endregion

  @override
  Future<List<ArticleModel>> getBusinessArticles(
      Map<String, dynamic> query, BuildContext context) async {
    ApiResponse apiResponse =
        await _handleApiResponse(ApiEndPoints.everyThing, query);
    if (apiResponse.statusCode == 200) {
      return _getArticles(apiResponse);
    } else {
      String exceptionMessage = ApiChecker.checkApi(apiResponse, context);
      throw Exception(exceptionMessage);
    }
  }
}
