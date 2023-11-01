import 'package:flutter/material.dart';
import '../models/receipt_list_item_model.dart';

class ReceiptListItem extends StatelessWidget {
  final ReceiptListItemModel model;

  const ReceiptListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(image: AssetImage(model.imageLocation)),
      title: Text(model.title),
    );
  }
}
