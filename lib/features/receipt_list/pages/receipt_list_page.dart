import 'package:flutter/material.dart';
import 'package:receipts/features/receipt_list/widgets/receipt_list_item.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipts'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 100; i++) const ReceiptListItem(),
            ],
          ),
        ),
      ),
    );
  }
}
