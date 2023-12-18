import 'package:receipts/features/receipt/domain/entities/ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptIngredientEntity {
  final int id;
  final int count;
  final IngredientEntity ingredient;
  final ReceiptEntity receipt;

  ReceiptIngredientEntity({
    required this.id,
    required this.count,
    required this.ingredient,
    required this.receipt,
  });
}
