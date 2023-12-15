import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'receipt_list_item_widget.dart';

class ReceiptListWidget extends StatefulWidget {
  final ReceiptRepository receiptRepository = ReceiptRepository();

  ReceiptListWidget({super.key});

  @override
  State<ReceiptListWidget> createState() => _ReceiptListWidgetState();
}

class _ReceiptListWidgetState extends State<ReceiptListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.receiptRepository.findReceipts(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ReceiptEntity>> snapshot,
      ) {
        if (snapshot.hasError) {
          throw Exception('Error.');
        }
        if (snapshot.hasData) {
          List<ReceiptEntity> receipts = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: receipts
                    .map((ReceiptEntity model) =>
                        ReceiptListItemWidget(receipt: model))
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
