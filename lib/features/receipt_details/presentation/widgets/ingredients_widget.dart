import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/dto/ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/receipt_model.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/ingredients_widget_item.dart';

class IngredientsWidget extends StatefulWidget {
  final ReceiptModel receipt;
  final ReceiptRepository receiptRepository = ReceiptRepository();

  IngredientsWidget({super.key, required this.receipt});

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<IngredientModel>>(
      future: widget.receiptRepository.findIngredientsByReceiptId(
        widget.receipt.id,
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw Exception('Error');
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<IngredientModel> ingredients = snapshot.data;
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
                  children: ingredients
                      .map(
                        (IngredientModel model) => IngredientsWidgetItem(
                          ingredient: model,
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
