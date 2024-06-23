part of 'app_router.dart';

abstract final class AppNavigator {
  static navigateToDetailsScreen(BuildContext context) {
    return Navigator.pushNamed(
      context,
      AppPathName.kNewsDetailsScreen,
    );
  }
}
