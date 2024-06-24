import 'package:news_app_task/core/usable_functions/api_service_helper.dart';
import 'package:news_app_task/features/news/data/models/article_model.dart';

abstract interface class ArticleRemoteDataSourceInterface {
  Future<List<ArticleModel>> getBusinessArticles(int pageNum);
}

final class ArticleRemoteDataSourceImpl
    implements ArticleRemoteDataSourceInterface {
  final ApiResponseHandler _apiResponseHandler;

  const ArticleRemoteDataSourceImpl(this._apiResponseHandler);

  //#region Private Methods
  List<ArticleModel> _getArticles(ApiResponse apiResponse) {
    final List<ArticleModel> articles = [];
    for (var json in apiResponse.response!.data['articles']) {
      articles.add(ArticleModel.fromJson(json));
    }
    return articles;
  }

//#endregion

  @override
  Future<List<ArticleModel>> getBusinessArticles(int pageNum) async {
    ApiResponse apiResponse = await _apiResponseHandler.handleGetApiResponse(
        ApiEndPoints.everyThing, {
      'q': 'business',
      'sortBy': 'publishedAt',
      'pageSize': 15,
      'page': pageNum
    });
    if (apiResponse.statusCode == 200) {
      return _getArticles(apiResponse);
    } else {
      throw Exception(apiResponse.error);
    }
  }
}
