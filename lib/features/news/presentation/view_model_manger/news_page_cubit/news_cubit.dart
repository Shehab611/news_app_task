import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/domain/use_cases/get_business_articles.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this._getBusinessArticlesUseCase) : super(const NewsInitial());

  @override
  Future<void> close() {
    _scrollController.dispose();
    return super.close();
  }

  //#region Private Variables
  final GetBusinessArticlesUseCase _getBusinessArticlesUseCase;
  final ScrollController _scrollController = ScrollController();
  int _page = 1;
  final List<Article> _articles = [];
  bool _loading = false;

//#endregion

  //#region Getters
  ScrollController get scrollController => _scrollController;

  List<Article> get articles => _articles;

  bool get loading => _loading;

  //#endregion

  //#region Private Methods
  Future<void> _getBusinessArticles() async {
    emit(const NewsLoadingState());
    _loading = true;
    final response = await _getBusinessArticlesUseCase.call(_page);
    if (response.error == null) {
      _page++;
      _articles.addAll(response.data!);
      emit(const NewsGetDataSuccessfullyState());
    } else {
      emit(NewsGetDataFailedState(response.error!));
    }
    _loading = false;
  }

//#endregion

  //#region Public Methods
  Future<void> getBusinessArticles() async {
    await _getBusinessArticles();
  }

  void loadMoreData() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_loading) {
      _getBusinessArticles();
    }
  }
//#endregion
}
