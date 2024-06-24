import 'package:news_app_task/core/base_use_case/base_use_case.dart';
import 'package:news_app_task/core/utils/api_utils/data_response.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/domain/repositories/article_repository_interface.dart';

final class GetBusinessArticlesImpl
    implements BaseUseCaseInterface<List<Article>, int> {
  final ArticlesRepositoryInterface _articlesRepository;

  const GetBusinessArticlesImpl(this._articlesRepository);

  @override
  Future<DataResponse<List<Article>>> call(int pageNum) async {
    return await _articlesRepository.getBusinessArticles(pageNum);
  }
}
