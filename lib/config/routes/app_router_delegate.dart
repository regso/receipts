import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_routing_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutingState>
    with PopNavigatorRouterDelegateMixin, ChangeNotifier {
  final GlobalKey<NavigatorState>? key = GlobalKey<NavigatorState>();
  AppRoutingState? _state;

  void push({
    required AppPageEnum pageSlug,
    Map<String, dynamic> args = const {},
  }) {
    _state!.pages = [
      ..._state!.pages,
      AppPage.createPageBySlug(pageSlug: pageSlug, args: args),
    ];
    notifyListeners();
  }

  // @override
  // Future<void> setInitialRoutePath(AppRoutingState configuration) {
  //   TODO: implement setInitialRoutePath
  //   return super.setInitialRoutePath(configuration);
  // }

  // Page createPageByUri() {
  //
  // }

  // void gotoReceiptList() {
  //   _state = AppRoutingState.receiptsPage();
  //   notifyListeners();
  // }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: key,
      pages: _state!.pages,
      // [
      // if (routingState.isSignUpPage())
      //   const MaterialPage(child: SignUpPage()),
      // if (routingState.isReceiptsPage())
      //   const MaterialPage(child: SignUpPage()),
      // if (routingState.isReceiptsPage())
      //   const MaterialPage(child: ReceiptsPage()),
      // ],
      onPopPage: (route, result) {
        if (_state!.pages.isNotEmpty) {
          _state!.pages.removeLast();
          notifyListeners();
        }
        return route.didPop(result);
      },
      // initialRoute: AppPage.pageUriMap[AppPageEnum.authSignUp]!,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => key;

  @override
  Future<void> setNewRoutePath(AppRoutingState configuration) async {
    _state = configuration;
  }

  @override
  AppRoutingState? get currentConfiguration {
    _state ??= AppRoutingState(
      pages: [AppPage.createPageBySlug(pageSlug: AppPageEnum.authSignUp)],
    );
    return _state;
  }
}
