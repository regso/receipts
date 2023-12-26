import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';

class CookingStepsItemWidget extends StatefulWidget {
  final CookingStepLinkEntity _cookingStepLink;

  const CookingStepsItemWidget({
    super.key,
    required CookingStepLinkEntity cookingStepLink,
  }) : _cookingStepLink = cookingStepLink;

  @override
  State<CookingStepsItemWidget> createState() => _CookingStepsItemWidgetState();
}

class _CookingStepsItemWidgetState extends State<CookingStepsItemWidget> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    String timeMinutes = widget._cookingStepLink.cookingStep.cookingTimeMinutes
        .toString()
        .padLeft(2, '0');
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
              widget._cookingStepLink.number.toString(),
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
              widget._cookingStepLink.cookingStep.title,
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
                  value: _checked,
                  onChanged: (bool? value) {
                    setState(() {
                      _checked = value as bool;
                    });
                  },
                  activeColor: AppTheme.receiptDetailsCookingStepCheckboxColor,
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
