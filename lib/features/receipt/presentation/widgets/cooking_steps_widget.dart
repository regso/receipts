import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_item_widget.dart';

class CookingStepsWidget extends StatelessWidget {
  final Future<List<CookingStepLinkEntity>> _futureCookingStepLinks;

  const CookingStepsWidget({
    super.key,
    required Future<List<CookingStepLinkEntity>> futureCookingStepLinks,
  }) : _futureCookingStepLinks = futureCookingStepLinks;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureCookingStepLinks,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<CookingStepLinkEntity> cookingStepLinks = snapshot.data!;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              Text(Labels.cookingSteps, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Column(
                children: cookingStepLinks.map((final cookingStepLink) {
                  return Column(
                    children: [
                      CookingStepsItemWidget(cookingStepLink: cookingStepLink),
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
      },
    );
  }
}
