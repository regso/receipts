import 'package:flutter/material.dart';
import 'package:receipts/features/receipt_list/pages/receipt_list_page.dart';

class ReceiptsApp extends StatelessWidget {
  const ReceiptsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipts App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ReceiptListPage(),
    );
  }
}
