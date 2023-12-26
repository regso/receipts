import 'package:hive/hive.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';

part 'local_receipt_ingredient_dto.g.dart';

@HiveType(typeId: 5)
class LocalReceiptIngredientDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int count;
  @HiveField(2)
  final int ingredientId;
  @HiveField(3)
  final int receiptId;

  LocalReceiptIngredientDto({
    required this.id,
    required this.count,
    required this.ingredientId,
    required this.receiptId,
  });

  factory LocalReceiptIngredientDto.fromModel(ReceiptIngredientModel model) {
    return LocalReceiptIngredientDto(
      id: model.id,
      count: model.count,
      ingredientId: model.ingredient.id,
      receiptId: model.receipt.id,
    );
  }
}
