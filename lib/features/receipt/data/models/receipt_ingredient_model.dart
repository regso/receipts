import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

class ReceiptIngredientModel extends ReceiptIngredientEntity {
  ReceiptIngredientModel({
    required super.id,
    required super.count,
    required super.ingredient,
    required super.receipt,
  });
}
