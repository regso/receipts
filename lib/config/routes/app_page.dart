//      URI             AUTH
// auth/sign-up           -
// auth/sign-in           -
// recipes               -+
// recipes?filter=1      -+
// recipes/{id}          -+
// user/profile           +
// user/sign-out          +
// user/favorite-receipts +
// error/not-found       -+

import 'package:flutter/material.dart';
import 'package:receipts/features/auth/presentation/pages/sign_up_page.dart';
import 'package:receipts/features/error/presentation/pages/not_found_page.dart';
import 'package:receipts/features/receipts/presentation/pages/receipts_page.dart';

enum AppPageEnum { authSignUp, receipts, errorNotFound } //, receiptsItem }

class AppPage {
  static const pageUriMap = {
    AppPageEnum.authSignUp: '/auth/sign-up',
    AppPageEnum.receipts: '/recipes',
    // AppPageEnum.receiptsItem: 'recipes/{id}',
    AppPageEnum.errorNotFound: '/error/not-found',
  };

  static Page createPageBySlug({
    required AppPageEnum pageSlug,
    Map<String, dynamic> args = const {},
  }) {
    // TODO: add args
    late Widget pageWidget;
    switch (pageSlug) {
      case AppPageEnum.authSignUp:
        pageWidget = const SignUpPage();
      case AppPageEnum.receipts:
        pageWidget = const ReceiptsPage();
      case AppPageEnum.errorNotFound:
        pageWidget = const NotFoundPage();
    }
    return MaterialPage(
      name: pageUriMap[pageSlug]!,
      arguments: null,
      child: pageWidget,
    );
  }
}
