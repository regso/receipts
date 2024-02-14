import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_routing_state.dart';

class AppRouteParser extends RouteInformationParser<AppRoutingState> {
  @override
  Future<AppRoutingState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    // TODO: finalize all slugs
    if (routeInformation.uri.path ==
            AppPage.pageUriMap[AppPageSlug.authSignUp] ||
        routeInformation.uri.path == '/') {
      return AppRoutingState(pageSlug: AppPageSlug.authSignUp);
    }
    if (routeInformation.uri.path == AppPage.pageUriMap[AppPageSlug.receipts]) {
      return AppRoutingState(pageSlug: AppPageSlug.receipts);
    }
    if (routeInformation.uri.path ==
        AppPage.pageUriMap[AppPageSlug.receiptDetails]) {
      return AppRoutingState(pageSlug: AppPageSlug.receiptDetails);
    }
    return AppRoutingState(pageSlug: AppPageSlug.errorNotFound);

    // log(routeInformation.uri.path);
    // final segments = routeInformation.uri.pathSegments;
    // if (segments.isEmpty) {
    //   return AppRoutingState(pages: []);
    // }
    // if (segments[0] == 'auth') {
    //   return AppRoutingState(pages: []);
    // }
    // if (segments[0] == 'receipts') {
    //   return AppRoutingState(pages: []);
    // }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutingState configuration) {
    // if (configuration.pages.isNotEmpty) {
    //   return RouteInformation(uri: Uri.parse(configuration.pages.last.name!));
    // }
    return RouteInformation(
        uri: Uri.parse(AppPage.pageUriMap[configuration.pageSlug]!));

    // if (configuration.pages.length == 1) {
    //   return RouteInformation(uri: Uri.parse('/auth/sign-up'));
    // }
    //
    // if (configuration.pages.length == 1) {
    //   return RouteInformation(uri: Uri.parse('/one'));
    // }
    // if (configuration.pages.length == 2) {
    //   return RouteInformation(uri: Uri.parse('/two'));
    // }
    // return RouteInformation(uri: Uri.parse('/one'));
  }
}
