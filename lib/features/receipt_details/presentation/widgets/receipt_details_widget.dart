import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/comment_list_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/receipt_header_widget.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptDetailsWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiptHeaderWidget(receipt: receipt),
        const SizedBox(height: 20),
        IngredientsWidget(receipt: receipt),
        const SizedBox(height: 20),
        const CookingStepsWidget(
          cookingStepModelList: [],
        ),
        const SizedBox(height: 27),
        const CommentListWidget(
          commentModelList: [],
        ),
      ],
    );
  }
}
