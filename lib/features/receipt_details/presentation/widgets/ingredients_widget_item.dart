import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';

class IngredientsWidgetItem extends StatelessWidget {
  final ReceiptIngredientModel receiptIngredientModel;

  const IngredientsWidgetItem({
    super.key,
    required this.receiptIngredientModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
            width: 10,
            child: Text(
              '·',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )),
        Flexible(
          fit: FlexFit.tight,
          flex: 5,
          child: Text(
            receiptIngredientModel.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.9,
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Text(receiptIngredientModel.amount,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.receiptDetailsIngredientsAmountColor,
              )),
        ),
      ],
    );
  }
}
