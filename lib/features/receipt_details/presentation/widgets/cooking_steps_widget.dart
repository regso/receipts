import 'package:flutter/material.dart';
import 'package:receipts/features/receipt_details/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/cooking_step_widget.dart';

class CookingStepsWidget extends StatelessWidget {
  final List<CookingStepModel> cookingStepModelList;
  
  const CookingStepsWidget({super.key, required this.cookingStepModelList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cookingStepModelList.map((CookingStepModel model) {
        return CookingStepWidget(cookingStepModel: model);
      }).toList(),
    );
  }
}
