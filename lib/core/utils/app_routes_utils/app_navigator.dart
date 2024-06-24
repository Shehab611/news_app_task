part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToDetailsScreen(BuildContext context,Article article) {
    return Navigator.pushNamed(
      context,
      AppPathName.kNewsDetailsScreen,
      arguments: article
    );
  }
}
