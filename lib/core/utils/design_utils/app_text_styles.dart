part of 'app_theme.dart';

abstract final class AppTextStyles {
  static const TextStyle appBarTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontWeight: FontWeight.w700,
    fontSize: AppSizes.fontSizeExtraLarge
  );

  static const TextStyle listTileTitleTextStyle = TextStyle(
    color: AppColors.defaultColor,
    fontWeight: FontWeight.w500,
    fontSize: AppSizes.fontSizeDefault
  );

  static const TextStyle listTileSubTitleTextStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w400,
    fontSize: AppSizes.fontSizeExtraSmall
  );
}
