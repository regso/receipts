import 'package:flutter/material.dart';

class AppRoutingState {
  // final String uri;
  List<Page> pages;
  final int? userId;

  AppRoutingState({required this.pages, this.userId});

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
}
