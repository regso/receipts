import 'package:flutter/material.dart';
import 'package:receipts/config/routes/app_route_parser.dart';
import 'package:receipts/config/routes/app_router_delegate.dart';

class ReceiptsApp extends StatelessWidget {
  const ReceiptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Receipts App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteParser(),
    );
  }
}
