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
import 'package:receipts/features/receipt/presentation/pages/receipt_page.dart';
import 'package:receipts/features/receipts/presentation/pages/receipts_page.dart';

enum AppPageSlug { authSignUp, receipts, receiptDetails, errorNotFound }

class AppPage {
  static const pageUriMap = {
    AppPageSlug.authSignUp: '/auth/sign-up',
    AppPageSlug.receipts: '/recipes',
    AppPageSlug.receiptDetails: '/recipes/{id}',
    AppPageSlug.errorNotFound: '/error/not-found',
  };

  static Page createPageBySlug({
    required AppPageSlug pageSlug,
    Map<String, dynamic> args = const {},
  }) {
    late Widget pageWidget;
    switch (pageSlug) {
      case AppPageSlug.authSignUp:
        pageWidget = const SignUpPage();
      case AppPageSlug.receipts:
        pageWidget = const ReceiptsPage();
      case AppPageSlug.receiptDetails:
        pageWidget = ReceiptPage(receiptId: args['receiptId']!);
      case AppPageSlug.errorNotFound:
        pageWidget = const NotFoundPage();
    }
    return MaterialPage(
      name: pageUriMap[pageSlug]!,
      arguments: null,
      child: pageWidget,
    );
  }
}
