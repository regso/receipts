import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_item_widget.dart';

class IngredientsWidget extends StatelessWidget {
  final ReceiptEntity receipt;

  const IngredientsWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptBloc, ReceiptState>(
      builder: (BuildContext context, ReceiptState state) {
        if (state is InitReceiptState) {
          return const Text('Initialized.');
        }

        if (state is LoadingReceiptState) {
          return const CircularProgressIndicator();
        }

        if (state is LoadedReceiptState) {
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
                    children: state.receiptIngredients
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
        }

        return const Text('Error');
      },
    );
  }
}
