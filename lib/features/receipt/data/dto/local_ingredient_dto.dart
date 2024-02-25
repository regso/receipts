import 'package:hive/hive.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';

part 'local_ingredient_dto.g.dart';

@HiveType(typeId: 1)
class LocalIngredientDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double caloriesForUnit;
  @HiveField(3)
  final int measureUnitId;

  LocalIngredientDto({
    required this.id,
    required this.title,
    required this.caloriesForUnit,
    required this.measureUnitId,
  });

  factory LocalIngredientDto.fromModel(IngredientModel model) {
    return LocalIngredientDto(
      id: model.id,
      title: model.title,
      caloriesForUnit: model.caloriesForUnit,
      measureUnitId: model.measureUnit.id,
    );
  }
}
