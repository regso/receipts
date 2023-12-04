import 'package:flutter/material.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/comment_list_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/receipt_header_widget.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final ReceiptModel receiptListItemModel;

  const ReceiptDetailsWidget({super.key, required this.receiptListItemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiptHeaderWidget(receiptListItemModel: receiptListItemModel),
        const SizedBox(height: 20),
        const IngredientsWidget(
          receiptIngredientModelList: [],
              // receiptListItemModel.receiptIngredientModelList,
        ),
        const SizedBox(height: 20),
        const CookingStepsWidget(
            cookingStepModelList: [],
            // receiptListItemModel.cookingStepModelList
        ),
        const SizedBox(height: 27),
        const CommentListWidget(
          commentModelList: [],
          // receiptListItemModel.commentModelList,
        ),
      ],
    );
  }
}
