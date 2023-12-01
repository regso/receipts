import 'package:flutter/material.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/comment_list_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/receipt_header_widget.dart';
import 'package:receipts/features/receipt_list/data/models/receipt_list_item_model.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final ReceiptListItemModel receiptListItemModel;

  const ReceiptDetailsWidget({super.key, required this.receiptListItemModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReceiptHeaderWidget(receiptListItemModel: receiptListItemModel),
        const SizedBox(height: 20),
        IngredientsWidget(
          receiptIngredientModelList:
              receiptListItemModel.receiptIngredientModelList,
        ),
        const SizedBox(height: 20),
        CookingStepsWidget(
            cookingStepModelList: receiptListItemModel.cookingStepModelList),
        const SizedBox(height: 27),
        CommentListWidget(
          commentModelList: receiptListItemModel.commentModelList,
        ),
      ],
    );
  }
}
