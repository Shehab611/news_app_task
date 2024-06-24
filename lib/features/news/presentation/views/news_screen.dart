import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_task/core/components/custom_components/custom_loader.dart';
import 'package:news_app_task/core/components/custom_components/custom_snack_bar.dart';
import 'package:news_app_task/core/components/custom_components/no_data_screen.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/core/utils/app_routes_utils/app_router.dart';
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
              onPressed: () {
                BlocProvider.of<NewsCubit>(context).changeTheme();
              }, icon: const Icon(Icons.light_mode_outlined)),
          IconButton(
              onPressed: () {
                BlocProvider.of<NewsCubit>(context).changeLocale();
              },
              icon: const Icon(Icons.language)),
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
          NewsCubit cubit = BlocProvider.of(context);
          if (state is NewsGetDataFailedState) {
            return const NoDataScreen();
          } else if (state is NewsLoadingState && cubit.articles.isEmpty) {
            return const CustomLoader();
          }
          if (cubit.articles.isEmpty) return const NoDataScreen();
          return ListView.builder(
            controller: cubit.scrollController,
            itemBuilder: (context, index) {
              if (index < cubit.articles.length) {
                return ArticleWidget(
                  title: cubit.articles[index].title,
                  source: cubit.articles[index].source.name,
                  imageLink: cubit.articles[index].urlToImage,
                  onTap: () {
                    AppNavigator.navigateToDetailsScreen(
                        context, cubit.articles[index]);
                  },
                );
              } else {
                cubit.scrollController.addListener(() {
                  cubit.loadMoreData();
                });
                return const CustomLoader();
              }
            },
            itemCount: cubit.articles.length + 1,
          );
        },
      ),
    );
  }
}
