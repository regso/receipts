class Constants {
  static int appUserId = 1;

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
