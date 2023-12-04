import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/models/measure_unit.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final int id;
  final String name;
  final String amount;
  final int caloriesForUnit;
  final MeasureUnit measureUnit;

  IngredientModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.caloriesForUnit,
    required this.measureUnit,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}
