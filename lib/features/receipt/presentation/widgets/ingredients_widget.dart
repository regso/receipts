import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_item_widget.dart';

class IngredientsWidget extends StatefulWidget {
  final ReceiptEntity receipt;
  final ReceiptRepository receiptRepository = ReceiptRepository();

  IngredientsWidget({super.key, required this.receipt});

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReceiptIngredientEntity>>(
      future: widget.receiptRepository.findReceiptIngredientsByReceipt(
        widget.receipt,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw Exception('Error');
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<ReceiptIngredientModel> receiptIngredients = snapshot.data;
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
                        (ReceiptIngredientModel model) => IngredientsItemWidget(
                          receiptIngredient: model,
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
