import 'package:flutter/material.dart';
import '../widgets/receipt_list.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipts'),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: ReceiptList(),
        ),
      ),
    );
  }
}
