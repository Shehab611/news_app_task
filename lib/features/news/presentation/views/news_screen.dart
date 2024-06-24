import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/features/news/presentation/widgets/article_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context).translate(AppStrings.newsScreen)),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.light_mode_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.language)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const ArticleWidget(
            title: 'Watching The Olympics Could Actually Influence How Much You Eat',
            publishDate: '2024-06-23T00:30:04Z',
            imageLink:
                'https://www.sciencealert.com/images/2024/06/friends-watching-sport-snthacks-beer.jpg',
          );
        },
        itemCount: 5,
      ),
    );
  }
}
