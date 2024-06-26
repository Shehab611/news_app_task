import 'package:flutter/material.dart';
import 'package:news_app_task/core/components/custom_components/custom_loader.dart';
import 'package:news_app_task/core/utils/design_utils/app_theme.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {super.key,
      required this.title,
      required this.source,
      required this.imageLink,
      this.onTap});

  final String title, source, imageLink;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.paddingSizeDefault),
          child: Image.network(
            imageLink,
            width: size.width * 0.35,
            height: size.width * 0.4,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return SizedBox(
                  width: size.width * 0.35,
                  height: size.width * 0.4,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                  ));
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                  width: size.width * 0.35,
                  height: size.width * 0.4,
                  child: const CustomLoader());
            },
          ),
        ),
        title: Text(
          title,
        ),
        subtitle: Text(
          source,
        ),
      ),
    );
  }
}
