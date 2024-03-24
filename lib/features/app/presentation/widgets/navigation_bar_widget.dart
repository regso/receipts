import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_router_delegate.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';

class NavigationBarWidget extends StatefulWidget {
  final AppPageSlug currentPageSlug;

  const NavigationBarWidget({
    super.key,
    required this.currentPageSlug,
  });

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  final _unAuthorizedPageSlugs = [
    AppPageSlug.receipts,
    AppPageSlug.authSignIn,
  ];

  final _authorizedPageSlugs = [
    AppPageSlug.receipts,
    AppPageSlug.fridge,
    AppPageSlug.favorites,
    AppPageSlug.userProfile,
  ];

  final List<BottomNavigationBarItem> _unAuthorizedItems = [
    BottomNavigationBarItem(
      icon: Image.asset(Constants.appIconPizzaPath),
      activeIcon: Image.asset(Constants.appIconPizzaActivePath),
      label: Labels.receipts,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(Constants.appIconUserPath),
      activeIcon: Image.asset(Constants.appIconUserActivePath),
      label: Labels.signIn,
    ),
  ];

  final List<BottomNavigationBarItem> _authorizedItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.local_pizza),
      label: Labels.receipts,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.view_agenda),
      label: Labels.navFridge,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.favorite),
      label: Labels.navFavorites,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: Labels.navProfile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final pageSlugs = (appBloc.state is AuthorizedUserAppState)
        ? _authorizedPageSlugs
        : _unAuthorizedPageSlugs;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.navBarShadowColor,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        items: (appBloc.state is AuthorizedUserAppState)
            ? _authorizedItems
            : _unAuthorizedItems,
        currentIndex: pageSlugs.indexOf(widget.currentPageSlug),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppTheme.navBarSelectedItemColor,
        unselectedItemColor: AppTheme.navBarUnSelectedItemColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: (int index) {
          (Router.of(context).routerDelegate as AppRouterDelegate)
              .open(pageSlug: pageSlugs[index]);
        },
      ),
    );
  }
}
