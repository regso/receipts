import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_routing_state.dart';

class AppRouteParser extends RouteInformationParser<AppRoutingState> {
  @override
  Future<AppRoutingState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    if (routeInformation.uri.path ==
            AppPage.pageUriMap[AppPageEnum.authSignUp] ||
        routeInformation.uri.path == '/') {
      return AppRoutingState(
        pages: [AppPage.createPageBySlug(pageSlug: AppPageEnum.authSignUp)],
      );
    }
    if (routeInformation.uri.path == AppPage.pageUriMap[AppPageEnum.receipts]) {
      return AppRoutingState(
        pages: [AppPage.createPageBySlug(pageSlug: AppPageEnum.receipts)],
      );
    }
    return AppRoutingState(
      pages: [AppPage.createPageBySlug(pageSlug: AppPageEnum.errorNotFound)],
    );

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
    if (configuration.pages.length == 1) {
      return RouteInformation(uri: Uri.parse('/auth/sign-up'));
    }
    return RouteInformation(uri: Uri.parse('/recipes'));
    // if (configuration.pages.length == 1) {
    //   return RouteInformation(uri: Uri.parse('/one'));
    // }
    // if (configuration.pages.length == 2) {
    //   return RouteInformation(uri: Uri.parse('/two'));
    // }
    // return RouteInformation(uri: Uri.parse('/one'));
  }
}
