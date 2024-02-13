import 'package:receipts/config/routes/app_page.dart';

class AppRoutingState {
  final AppPageSlug pageSlug;
  final Map<String, dynamic>? args;
  final int? userId;

  AppRoutingState({required this.pageSlug, this.args, this.userId});
}

// factory AppRoutingState.fromPageSlug({
//   required AppPageSlug pageSlug,
//   Map<String, dynamic> pageArgs = const {},
// }) {
//   String uri = pageUriMap[pageSlug]!;
//   TODO: set args
// return AppRoutingState._(uri: uri);
// }

// List<Page> getPageStack() {
//   return [];
// }

/* factory AppRoutingState.authSignUpPage() {
    return AppRoutingState._(
      uri: routingPatterns[AppRoutingUri.authSignUp]!,
      stack: [],
    );
  }

  factory AppRoutingState.receiptsPage() {
    return AppRoutingState._(
      uri: routingPatterns[AppRoutingUri.receipts]!,
      stack: [],
    );
  }

  factory AppRoutingState.receiptsItem(int receiptsItemId, int? userId) {
    return AppRoutingState._(
      uri: routingPatterns[AppRoutingUri.receiptsItem]!
          .replaceFirst('{id}', receiptsItemId.toString()),
      userId: userId,
      stack: [],
    );
  }*/
