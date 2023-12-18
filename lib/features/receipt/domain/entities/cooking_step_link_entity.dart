import 'package:receipts/features/receipt/domain/entities/cooking_step_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class CookingStepLinkEntity {
  final int id;
  final int number;
  final ReceiptEntity receipt;
  final CookingStepEntity cookingStep;

  CookingStepLinkEntity({
    required this.id,
    required this.number,
    required this.receipt,
    required this.cookingStep,
  });
}