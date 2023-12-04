import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/ingredients_widget_item.dart';

class IngredientsWidget extends StatelessWidget {
  final List<ReceiptIngredientModel> receiptIngredientModelList;

  const IngredientsWidget({
    super.key,
    required this.receiptIngredientModelList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          Text(Labels.ingredients, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: AppTheme.receiptDetailsBorderColor, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: receiptIngredientModelList
                  .map(
                    (ReceiptIngredientModel model) =>
                        IngredientsWidgetItem(receiptIngredientModel: model),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
