import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

class ReceiptWidget extends StatelessWidget {
  final ReceiptEntity _receipt;

  const ReceiptWidget({super.key, required ReceiptEntity receipt})
      : _receipt = receipt;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ReceiptHeaderWidget(receipt: _receipt),
          const SizedBox(height: 20),
          IngredientsWidget(receipt: _receipt),
          const SizedBox(height: 20),
          CookingStepsWidget(receipt: _receipt),
          const SizedBox(height: 27),
          CommentsWidget(receipt: _receipt),
        ],
      ),
    );
  }
}
