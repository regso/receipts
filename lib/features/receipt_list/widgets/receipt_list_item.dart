import 'package:flutter/material.dart';

class ReceiptListItem extends StatelessWidget {
  const ReceiptListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Image(image: AssetImage('assets/images/receipt-1.png')),
      title: Text('List Item'),
    );
  }
}
