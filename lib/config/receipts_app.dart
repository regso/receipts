import 'package:flutter/material.dart';
import 'package:receipts/config/route_matcher.dart';

class ReceiptsApp extends StatelessWidget {
  const ReceiptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipts App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: RouteMatcher.routeReceipts,
      routes: RouteMatcher.getRoutesMap(),
    );
  }
}
