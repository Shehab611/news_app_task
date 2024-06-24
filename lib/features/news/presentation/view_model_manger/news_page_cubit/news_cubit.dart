import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/domain/use_cases/get_business_articles.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getBusinessArticlesUseCase) : super(const NewsInitial());

  //#region Private Variables
  final GetBusinessArticlesUseCase _getBusinessArticlesUseCase;
  int _page = 1;
  final List<Article> _articles = [];

//#endregion

  //#region Private Methods
  Future<void> _getBusinessArticles() async {
    emit(const NewsLoadingState());
    final response = await _getBusinessArticlesUseCase.call(_page);
    _page++;
    if (response.error == null) {
      _articles.addAll(response.data!);
      emit(NewsGetDataSuccessfullyState(_articles));
    } else {
      emit(NewsGetDataFailedState(response.error!));
    }
  }

//#endregion

  //#region Public Methods
  Future<void> getBusinessArticles() async {
    await _getBusinessArticles();
  }
//#endregion
}
