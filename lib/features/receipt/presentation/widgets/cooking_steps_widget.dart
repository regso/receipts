import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_item_widget.dart';

class CookingStepsWidget extends StatelessWidget {
  final ReceiptEntity receipt;

  const CookingStepsWidget({super.key, required this.receipt});

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
                Text(Labels.cookingSteps, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                Column(
                  children: state.cookingStepLinks.map((final cookingStepLink) {
                    return Column(
                      children: [
                        CookingStepsItemWidget(
                          cookingStepLink: cookingStepLink,
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      minimumSize: const Size(232, 48),
                      backgroundColor:
                          AppTheme.receiptDetailsButtonBackgroundColor,
                    ),
                    child: Text(
                      Labels.startCooking,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.receiptDetailsButtonTextColor,
                      ),
                    ),
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
