import 'package:flutter/material.dart';
import 'package:receipts/features/receipts/presentation/pages/receipts_page.dart';

class ReceiptsApp extends StatelessWidget {
  const ReceiptsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipts App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ReceiptsPage(),
    );
  }
}
