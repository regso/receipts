import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';

class CookingStepLinkModel extends CookingStepLinkEntity {
  CookingStepLinkModel({
    required super.id,
    required super.number,
    required super.receipt,
    required super.cookingStep,
  });
}
