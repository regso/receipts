import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_routing_state.dart';

class AppRouteParser extends RouteInformationParser<AppRoutingState> {
  final AppPageSlug defaultPageSlug;

  AppRouteParser({required this.defaultPageSlug});

  @override
  Future<AppRoutingState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final segments = routeInformation.uri.pathSegments;
    if (routeInformation.uri.path == '/') {
      return AppRoutingState(pageSlug: defaultPageSlug);
    }
    if (routeInformation.uri.path ==
        AppPage.pageUriMap[AppPageSlug.authSignUp]) {
      return AppRoutingState(pageSlug: AppPageSlug.authSignUp);
    }
    if (routeInformation.uri.path ==
        AppPage.pageUriMap[AppPageSlug.authSignIn]) {
      return AppRoutingState(pageSlug: AppPageSlug.authSignIn);
    }
    if (routeInformation.uri.path == AppPage.pageUriMap[AppPageSlug.receipts]) {
      return AppRoutingState(pageSlug: AppPageSlug.receipts);
    }
    if (routeInformation.uri.path ==
            AppPage.pageUriMap[AppPageSlug.receiptDetails] &&
        segments.length > 1 &&
        int.tryParse(segments[1]) != null) {
      return AppRoutingState(
        pageSlug: AppPageSlug.receiptDetails,
        args: {'receiptId': int.parse(segments[1])},
      );
    }

    return AppRoutingState(pageSlug: AppPageSlug.errorNotFound);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutingState configuration) {
    return RouteInformation(
      uri: Uri.parse(AppPage.pageUriMap[configuration.pageSlug]!),
    );
  }
}
