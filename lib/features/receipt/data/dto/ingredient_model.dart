import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/measure_unit_model.dart';

part 'ingredient_model.g.dart';

@JsonSerializable()
class IngredientModel {
  final int id;
  final String name;
  final double caloriesForUnit;
  @JsonKey(name: 'measureUnit')
  final MeasureUnitIdModel measureUnitIdModel;

  IngredientModel({
    required this.id,
    required this.name,
    required this.caloriesForUnit,
    required this.measureUnitIdModel,
  });

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientModelToJson(this);
}

@JsonSerializable()
class IngredientIdModel {
  final int id;

  IngredientIdModel({
    required this.id,
  });

  factory IngredientIdModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientIdModelToJson(this);
}
