import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';

class IngredientsItemWidget extends StatelessWidget {
  final ReceiptIngredientModel receiptIngredient;

  const IngredientsItemWidget({
    super.key,
    required this.receiptIngredient,
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
            receiptIngredient.ingredient.title,
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
          child: Text(
            (receiptIngredient.count > 0 ? '${receiptIngredient.count} ' : '') +
                receiptIngredient.ingredient.measureUnit.one,
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.receiptDetailsIngredientsAmountColor,
            ),
          ),
        ),
      ],
    );
  }
}
