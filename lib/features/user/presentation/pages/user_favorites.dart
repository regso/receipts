import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/config/routes/app_router_delegate.dart';

class UserFavorites extends StatelessWidget {
  const UserFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text('User Favorites'),
          OutlinedButton(
            onPressed: () {
              (Router.of(context).routerDelegate as AppRouterDelegate)
                  .open(pageSlug: AppPageSlug.receipts);
            },
            child: const Text('Go'),
          ),
        ],
      )),
    );
  }
}
