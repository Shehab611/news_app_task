import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/service_locator.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/domain/use_cases/get_business_articles.dart';
import 'package:news_app_task/features/news/presentation/view_model_manger/news_page_cubit/news_cubit.dart';
import 'package:news_app_task/features/news/presentation/views/news_details_screen.dart';
import 'package:news_app_task/features/news/presentation/views/news_screen.dart';

part 'app_navigator.dart';

part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
    AppPathName.kNewsScreen: (BuildContext context) => BlocProvider(
          create: (context) => NewsCubit(GetBusinessArticlesUseCase(sl.get()))
            ..getBusinessArticles(),
          child: const NewsScreen(),
        ),
    AppPathName.kNewsDetailsScreen: (BuildContext context) =>
        const NewsDetailsScreen(),
  };
}
