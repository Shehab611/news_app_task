import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_task/core/usable_functions/api_service_helper.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/core/utils/design_utils/app_theme.dart';
import 'package:news_app_task/features/news/data/repositories/article_repository.dart';
import 'package:news_app_task/features/news/data/sources/article_remote_data_source.dart';
import 'package:news_app_task/features/news/domain/repositories/article_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initServicesLocator() async {
  //#region Core
  sl.registerLazySingleton<DioClient>(() =>
      DioClient(ApiEndPoints.baseUrl, sl.get(), loggingInterceptor: sl.get()));
  sl.registerLazySingleton<AppLanguage>(() => AppLanguage());
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton<ApiResponseHandler>(
      () => ApiResponseHandler(sl.get()));
  //#endregion

  //#region Repos
  sl.registerLazySingleton<ArticlesRepositoryInterface>(
      () => ArticlesRepositoryImpl(sl.get()));
  //#endregion

  //#region Data Sources
  sl.registerLazySingleton<ArticleRemoteDataSourceInterface>(
      () => ArticleRemoteDataSourceImpl(sl.get()));
  //#endregion

  //#region External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  //#endregion
}
