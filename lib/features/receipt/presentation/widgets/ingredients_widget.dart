import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_item_widget.dart';

class IngredientsWidget extends StatelessWidget {
  final Future<List<ReceiptIngredientEntity>> _futureIngredients;

  const IngredientsWidget({
    super.key,
    required ReceiptEntity receipt,
    required Future<List<ReceiptIngredientEntity>> futureIngredients,
  }) : _futureIngredients = futureIngredients;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureIngredients,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<ReceiptIngredientEntity> receiptIngredients = snapshot.data!;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Text(Labels.ingredients, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppTheme.receiptDetailsBorderColor, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: receiptIngredients
                      .map(
                        (entity) => IngredientsItemWidget(
                          receiptIngredient: entity,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
