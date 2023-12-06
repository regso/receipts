import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'receipt_list_item.dart';

class ReceiptList extends StatefulWidget {
  final ReceiptRepository receiptRepository = ReceiptRepository();
  
  ReceiptList({super.key});

  @override
  State<ReceiptList> createState() => _ReceiptListState();
}

class _ReceiptListState extends State<ReceiptList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.receiptRepository.findReceipts(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ReceiptModel>> snapshot,
      ) {
        if (snapshot.hasError) {
          throw Exception('Error.');
        }
        if (snapshot.hasData) {
          List<ReceiptModel> receipts = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: receipts
                    .map((ReceiptModel model) => ReceiptListItem(receipt: model))
                    .toList(),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
