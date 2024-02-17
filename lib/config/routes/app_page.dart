import 'package:flutter/material.dart';
import 'package:receipts/features/auth/presentation/pages/sign_in_page.dart';
import 'package:receipts/features/auth/presentation/pages/sign_up_page.dart';
import 'package:receipts/features/error/presentation/pages/not_found_page.dart';
import 'package:receipts/features/fridge/presentation/pages/fridge_page.dart';
import 'package:receipts/features/receipt/presentation/pages/receipt_page.dart';
import 'package:receipts/features/receipts/presentation/pages/receipts_page.dart';
import 'package:receipts/features/user/presentation/pages/user_favorites_page.dart';
import 'package:receipts/features/user/presentation/pages/user_profile_page.dart';

enum AppPageSlug {
  authSignUp,
  authSignIn,
  receipts,
  receiptDetails,
  userProfile,
  userFavorites,
  fridge,
  errorNotFound,
}

class AppPage {
  static const pageUriMap = {
    AppPageSlug.authSignUp: '/auth/sign-up',
    AppPageSlug.authSignIn: '/auth/sign-in',
    AppPageSlug.receipts: '/recipes',
    AppPageSlug.receiptDetails: '/recipes/{id}',
    AppPageSlug.userProfile: '/user/profile',
    AppPageSlug.userFavorites: '/user/favorites',
    AppPageSlug.fridge: '/fridge',
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
      case AppPageSlug.authSignIn:
        pageWidget = const SignInPage();
      case AppPageSlug.receipts:
        pageWidget = const ReceiptsPage();
      case AppPageSlug.receiptDetails:
        pageWidget = ReceiptPage(receiptId: args['receiptId']!);
      case AppPageSlug.userProfile:
        pageWidget = const UserProfilePage();
      case AppPageSlug.userFavorites:
        pageWidget = const UserFavoritesPage();
      case AppPageSlug.fridge:
        pageWidget = const FridgePage();
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
