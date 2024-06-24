import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/components/custom_components/custom_loader.dart';
import 'package:news_app_task/core/components/custom_components/custom_snack_bar.dart';
import 'package:news_app_task/core/components/custom_components/no_data_screen.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/features/news/presentation/view_model_manger/news_page_cubit/news_cubit.dart';
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
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          if (state is NewsGetDataFailedState) {
            showCustomSnackBar(
                AppLocalizations.of(context).translate(state.error), context);
          }
        },
        builder: (context, state) {
          if (state is NewsGetDataSuccessfullyState) {
            if (state.articles.isEmpty) return const NoDataScreen();
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(
                  title: state.articles[index].title,
                  publishDate: state.articles[index].publishedAt,
                  imageLink: state.articles[index].urlToImage,
                );
              },
              itemCount: state.articles.length,
            );
          } else if (state is NewsGetDataFailedState) {
            return const NoDataScreen();
          }
          return const CustomLoader();
        },
      ),
    );
  }
}
