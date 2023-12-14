class Constants {
  static int appUserId = 1;

  static String appIconAvatarPath = 'assets/images/user_avatar_example.png';
  static String appIconHornPath = 'assets/images/horn.png';
  static String appIconLikedPath = 'assets/images/liked.png';
  static String appIconUnLikedPath = 'assets/images/unliked.png';
  static String appIconPizzaPath = 'assets/images/pizza_gray.png';
  static String appIconPizzaActivePath = 'assets/images/pizza.png';
  static String appIconUserPath = 'assets/images/user_gray.png';
  static String appIconUserActivePath = 'assets/images/user.png';

  static String hiveReceiptsBoxName = 'receipts_box_0';
  static String hiveIngredientsBoxName = 'ingredients_box_1';
  static String hiveCookingStepBoxName = 'cooking_steps_box_2';
  static String hiveCommentsBoxName = 'comments_box_3';

  static String apiBaseUrl = 'https://foodapi.dzolotov.tech';
  static String apiGetReceiptUrl = '/recipe';
  static String apiGetReceiptIngredientUrl = '/recipe_ingredient';
  static String apiGetIngredientUrl = '/ingredient';
  static String apiGetMeasureUnitUrl = '/measure_unit';
  static String apiGetCookingStepLinkUrl = '/recipe_step_link';
  static String apiGetCookingStepUrl = '/recipe_step';
  static String apiGetCommentUrl = '/comment';
  static String apiPostCommentUrl = '/comment';

  static String httpAcceptLanguageHeader = 'en-US,en;q=0.9,ru;q=0.8';
  static String httpUserAgentHeader =
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36';
  static String httpRefererHeader = 'https://foodapi.dzolotov.tech/';
}
