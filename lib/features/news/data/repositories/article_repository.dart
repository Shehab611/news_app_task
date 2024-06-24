import 'package:news_app_task/core/utils/api_utils/data_response.dart';
import 'package:news_app_task/features/news/data/sources/article_remote_data_source.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/domain/repositories/article_repository_interface.dart';

final class ArticlesRepositoryImpl implements ArticlesRepositoryInterface {
  final ArticleRemoteDataSourceInterface _dataSource;

  const ArticlesRepositoryImpl(this._dataSource);

  @override
  Future<DataResponse<List<Article>>> getBusinessArticles(
      Map<String, dynamic> query) async {
    try {
      final data = await _dataSource.getBusinessArticles(query);
      return DataResponse.withSuccess(data);
    } catch (e) {
      return DataResponse.withError(e.toString());
    }
  }
}
