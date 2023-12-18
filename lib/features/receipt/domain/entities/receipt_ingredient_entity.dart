import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptIngredientEntity {
  final int id;
  final int count;
  final IngredientModel ingredient;
  final ReceiptEntity receipt;

  ReceiptIngredientEntity({
    required this.id,
    required this.count,
    required this.ingredient,
    required this.receipt,
  });
}
