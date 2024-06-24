part of 'news_cubit.dart';

sealed class NewsState extends Equatable {
  const NewsState();
}

final class NewsInitial extends NewsState {
  const NewsInitial();

  @override
  List<Object> get props => [];
}

final class NewsLoadingState extends NewsState {
  const NewsLoadingState();

  @override
  List<Object> get props => [];
}

final class NewsGetDataSuccessfullyState extends NewsState {
  const NewsGetDataSuccessfullyState();

  @override
  List<Object> get props => [];
}

final class NewsGetDataFailedState extends NewsState {
  const NewsGetDataFailedState(this.error);
  final String error;
  @override
  List<Object> get props => [];
}

final class NewsChangeLanguageState extends NewsState {
  const NewsChangeLanguageState();

  @override
  List<Object> get props => [];
}