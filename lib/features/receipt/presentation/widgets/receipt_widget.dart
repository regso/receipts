import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

class ReceiptWidget extends StatelessWidget {
  final ReceiptEntity receipt;

  const ReceiptWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiptHeaderWidget(receipt: receipt),
        const SizedBox(height: 20),
        IngredientsWidget(receipt: receipt),
        const SizedBox(height: 20),
        CookingStepsWidget(receipt: receipt),
        const SizedBox(height: 27),
        CommentsWidget(receipt: receipt),
      ],
    );
  }
}
