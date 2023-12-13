import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/presentation/widgets/comment_list_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

class ReceiptWidget extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiptHeaderWidget(receipt: receipt),
        const SizedBox(height: 20),
        IngredientsWidget(receipt: receipt),
        const SizedBox(height: 20),
        CookingStepsWidget(receiptId: receipt.id),
        const SizedBox(height: 27),
        CommentListWidget(receiptId: receipt.id),
      ],
    );
  }
}
