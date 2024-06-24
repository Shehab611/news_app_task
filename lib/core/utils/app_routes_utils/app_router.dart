import 'package:flutter/material.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:news_app_task/features/news/presentation/views/news_details_screen.dart';
import 'package:news_app_task/features/news/presentation/views/news_screen.dart';

part 'app_navigator.dart';
part 'app_paths.dart';

abstract final class AppRouter {
  static final Map<String, WidgetBuilder> routes = {
  AppPathName.kNewsScreen:(BuildContext context)=>const NewsScreen(),
  AppPathName.kNewsDetailsScreen:(BuildContext context)=>const NewsDetailsScreen(),
  };
}
