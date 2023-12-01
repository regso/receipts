import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt_details/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/cooking_step_widget.dart';

class CookingStepsWidget extends StatelessWidget {
  final List<CookingStepModel> cookingStepModelList;

  const CookingStepsWidget({super.key, required this.cookingStepModelList});

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          Text(Labels.cookingSteps, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          Column(
            children: cookingStepModelList.map((CookingStepModel model) {
              return Column(
                children: [
                  CookingStepWidget(cookingStepModel: model, number: i++),
                  const SizedBox(height: 16),
                ],
              );
            }).toList(),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                minimumSize: const Size(232, 48),
                backgroundColor: AppTheme.receiptDetailsButtonBackgroundColor,
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
}
