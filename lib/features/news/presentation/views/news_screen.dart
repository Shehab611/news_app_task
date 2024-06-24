import 'package:flutter/material.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';

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
    );
  }
}
