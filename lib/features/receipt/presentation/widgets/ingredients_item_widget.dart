import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';

class IngredientsItemWidget extends StatelessWidget {
  final IngredientModel ingredient;

  const IngredientsItemWidget({
    super.key,
    required this.ingredient,
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
            ingredient.title,
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
            (ingredient.amount > 0 ? '${ingredient.amount} ' : '') +
                ingredient.measure,
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
