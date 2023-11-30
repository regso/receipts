import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt_details/data/models/cooking_step_model.dart';

class CookingStepWidget extends StatelessWidget {
  final CookingStepModel cookingStepModel;
  final int number;

  const CookingStepWidget(
      {super.key, required this.cookingStepModel, required this.number});

  @override
  Widget build(BuildContext context) {
    String timeMinutes =
        cookingStepModel.cookingTimeMinutes.toString().padLeft(2, '0');
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: AppTheme.receiptDetailsCookingStepBackground,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 40,
                color: AppTheme.receiptDetailsCookingStepLeadingColor,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17),
            child: Text(
              cookingStepModel.title,
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.receiptDetailsCookingStepTitleColor,
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  checkColor: AppTheme.receiptDetailsCookingStepCheckboxColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  '$timeMinutes:00',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.receiptDetailsCookingStepCheckboxColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
