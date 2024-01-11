import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';

class CookingStepsItemWidget extends StatelessWidget {
  final CookingStepLinkEntity _cookingStepLink;

  const CookingStepsItemWidget({
    super.key,
    required CookingStepLinkEntity cookingStepLink,
  }) : _cookingStepLink = cookingStepLink;

  @override
  Widget build(BuildContext context) {
    String timeMinutes = _cookingStepLink.cookingStep.cookingTimeMinutes
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
              _cookingStepLink.number.toString(),
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
                _cookingStepLink.cookingStep.title,
                style: TextStyle(
                  fontSize: 12,
                  color: AppTheme.receiptDetailsCookingStepTitleColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const _CookingStepCheckBox(),
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

class _CookingStepCheckBox extends StatefulWidget {
  const _CookingStepCheckBox();

  @override
  State<_CookingStepCheckBox> createState() => _CookingStepCheckBoxState();
}

class _CookingStepCheckBoxState extends State<_CookingStepCheckBox>
    with SingleTickerProviderStateMixin {
  bool _checked = false;
  late AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 100),
    vsync: this,
    lowerBound: 1,
    upperBound: 1.5,
    debugLabel: 'Debug',
  );

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: animationController,
      child: Checkbox(
        value: _checked,
        onChanged: (bool? value) {
          setState(() {
            _checked = value as bool;
            animationController.forward();
          });
        },
        activeColor: AppTheme.receiptDetailsCookingStepCheckboxColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      builder: (context, value, child) => Transform.scale(
        scale: value,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}