import 'package:flutter/material.dart';
import '../models/receipt_list_item_model.dart';
import '../repositories/receipt_list_repository.dart';
import '../widgets/receipt_list_item.dart';

class ReceiptList extends StatefulWidget {
  const ReceiptList({Key? key}) : super(key: key);

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
        AsyncSnapshot<List<ReceiptListItemModel>> snapshot,
      ) {
        if (snapshot.hasData) {
          List<ReceiptListItemModel> models = snapshot.data ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: models
                  .map((ReceiptListItemModel model) =>
                      ReceiptListItem(model: model))
                  .toList(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error.');
        }
        return const Text('...');
      },
    );
  }

  Future<List<ReceiptListItemModel>> _getReceiptModels() async {
    ReceiptListRepository receiptListRepository = ReceiptListRepository();
    return await receiptListRepository.getListItems();
  }
}
