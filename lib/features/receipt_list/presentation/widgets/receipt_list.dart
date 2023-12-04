import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'receipt_list_item.dart';

class ReceiptList extends StatefulWidget {
  const ReceiptList({super.key});

  @override
  State<ReceiptList> createState() => _ReceiptListState();
}

class _ReceiptListState extends State<ReceiptList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getReceiptModels(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ReceiptModel>> snapshot,
      ) {
        if (snapshot.hasError) {
          throw Exception('Error.');
        }
        if (snapshot.hasData) {
          List<ReceiptModel> models = snapshot.data ?? [];
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: models
                    .map((ReceiptModel model) => ReceiptListItem(model: model))
                    .toList(),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<List<ReceiptModel>> _getReceiptModels() async {
    ReceiptRepository receiptRepository = ReceiptRepository();
    return receiptRepository.getList();
  }
}
