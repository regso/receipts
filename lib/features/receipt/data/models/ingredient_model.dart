import 'package:hive/hive.dart';

part 'ingredient_model.g.dart';

@HiveType(typeId: 1)
class IngredientModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final String measure;

  IngredientModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.measure,
  });
}
