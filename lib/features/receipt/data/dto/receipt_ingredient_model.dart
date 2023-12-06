import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/receipt_model.dart';

part 'receipt_ingredient_model.g.dart';

@JsonSerializable()
class ReceiptIngredientModel {
  final int id;
  final int count;
  @JsonKey(name: 'ingredient')
  final IngredientIdModel ingredientIdModel;
  @JsonKey(name: 'recipe')
  final ReceiptIdModel receiptIdModel;

  ReceiptIngredientModel({
    required this.id,
    required this.count,
    required this.ingredientIdModel,
    required this.receiptIdModel,
  });

  factory ReceiptIngredientModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptIngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptIngredientModelToJson(this);
}
