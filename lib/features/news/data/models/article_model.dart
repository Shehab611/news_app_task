import 'package:news_app_task/features/news/domain/entities/article.dart';

final class ArticleModel extends Article {
  const ArticleModel(
      {required super.source,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
        source: json['source'],
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}
