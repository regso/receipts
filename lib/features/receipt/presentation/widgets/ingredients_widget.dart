import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_item_widget.dart';

class IngredientsWidget extends StatefulWidget {
  final ReceiptRepository _receiptRepository = ReceiptRepository();
  final ReceiptEntity _receipt;

  IngredientsWidget({super.key, required ReceiptEntity receipt})
      : _receipt = receipt;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  late Future<List<ReceiptIngredientEntity>> _futureIngredients;

  @override
  void initState() {
    super.initState();
    _futureIngredients =
        widget._receiptRepository.findReceiptIngredientsByReceipt(
      widget._receipt,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureIngredients,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw Exception('Error');
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
