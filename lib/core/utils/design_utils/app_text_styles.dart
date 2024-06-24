part of 'app_theme.dart';

abstract final class AppTextStyles {
  static const TextStyle appBarTextStyle = TextStyle(
      fontWeight: FontWeight.w700, fontSize: AppSizes.fontSizeExtraLarge);

  static const TextStyle listTileTitleTextStyle = TextStyle(
      fontWeight: FontWeight.w500, fontSize: AppSizes.fontSizeDefault);

  static const TextStyle listTileSubTitleTextStyle = TextStyle(
      fontWeight: FontWeight.w400, fontSize: AppSizes.fontSizeExtraSmall);

  static const TextStyle titleTextStyle = TextStyle(
      fontWeight: FontWeight.w800, fontSize: AppSizes.fontSizeExtraLarge);

  static const TextStyle highlightTextStyle =
      TextStyle(fontWeight: FontWeight.w600, fontSize: AppSizes.fontSizeLarge);
}
