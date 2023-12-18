import 'package:receipts/features/receipt/data/models/measure_unit_model.dart';

class IngredientModel {
  final int id;
  final String title;
  final MeasureUnitModel measureUnit;

  IngredientModel({
    required this.id,
    required this.title,
    required this.measureUnit,
  });
}
