import 'package:news_app_task/core/utils/api_utils/data_response.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';

abstract interface class ProductsRepositoryInterface {
  Future<Response<List<Article>>> getBusinessArticles();

  Future<Response<List<Article>>> getSportsArticles();

  Future<Response<List<Article>>> getScienceArticles();
}
