import 'package:flutter/material.dart';
import 'package:news_app_task/core/components/custom_components/custom_loader.dart';
import 'package:news_app_task/core/utils/app_constants/app_strings.dart';
import 'package:news_app_task/core/utils/design_utils/app_theme.dart';
import 'package:news_app_task/features/news/domain/entities/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)!.settings.arguments as Article;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
        actions: [
          IconButton(
              onPressed: () async {
                await launchUrl(Uri.parse(article.url));
              },
              icon: const Icon(Icons.link))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.paddingSizeEight),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppSizes.paddingSizeDefault),
                    child: Image.network(
                      article.urlToImage,
                      width: double.infinity,
                      height: size.height * 0.25,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CustomLoader();
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: AppSizes.paddingSizeDefault),
                    child: Center(
                        child: Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleTextStyle,
                    )),
                  ),
                ],
              ),
              if (article.author.isNotEmpty)
                Padding(
                  padding:
                      const EdgeInsets.only(top: AppSizes.paddingSizeDefault),
                  child: Center(
                      child: Text(
                    '${AppLocalizations.of(context).translate(AppStrings.by)} : ${article.author}',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.highlightTextStyle,
                  )),
                ),
              Padding(
                padding:
                const EdgeInsets.only(top: AppSizes.paddingSizeDefault),
                child: Center(
                    child: Text(
                      '${AppLocalizations.of(context).translate(AppStrings.at)} : ${article.publishedAt}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.highlightTextStyle,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: AppSizes.paddingSizeDefault),
                child: Center(
                    child: Text(
                  article.content,
                )),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
