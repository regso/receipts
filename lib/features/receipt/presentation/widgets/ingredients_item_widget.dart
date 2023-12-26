import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

class IngredientsItemWidget extends StatelessWidget {
  final ReceiptIngredientEntity _receiptIngredient;

  const IngredientsItemWidget({
    super.key,
    required ReceiptIngredientEntity receiptIngredient,
  }) : _receiptIngredient = receiptIngredient;

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
            _receiptIngredient.ingredient.title,
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
            (_receiptIngredient.count > 0
                    ? '${_receiptIngredient.count} '
                    : '') +
                _receiptIngredient.ingredient.measureUnit.one,
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
