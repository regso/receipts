import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';

class IngredientEntity {
  final int id;
  final String title;
  final MeasureUnitEntity measureUnit;

  IngredientEntity({
    required this.id,
    required this.title,
    required this.measureUnit,
  });
}
