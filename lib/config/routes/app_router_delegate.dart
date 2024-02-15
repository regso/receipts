import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_routing_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutingState>
    with PopNavigatorRouterDelegateMixin, ChangeNotifier {
  final GlobalKey<NavigatorState>? key = GlobalKey<NavigatorState>();
  AppRoutingState _state = AppRoutingState(pageSlug: AppPage.defaultPageSlug);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: key,
      pages: (_state.pageSlug == AppPageSlug.receiptDetails)
          ? [
              AppPage.createPageBySlug(pageSlug: AppPageSlug.receipts),
              AppPage.createPageBySlug(
                pageSlug: _state.pageSlug,
                args: {'receiptId': _state.args!['receiptId']!},
              ),
            ]
          : [AppPage.createPageBySlug(pageSlug: _state.pageSlug)],
      onPopPage: (route, result) {
        return route.didPop(result);
      },
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
    return _state;
  }

  void open({
    required AppPageSlug pageSlug,
    Map<String, dynamic> args = const {},
  }) {
    _state = AppRoutingState(pageSlug: pageSlug, args: args);
    notifyListeners();
  }
}
