import 'package:hive/hive.dart';

part 'local_cooking_step_dto.g.dart';

@HiveType(typeId: 2)
class LocalCookingStepDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int cookingTimeMinutes;

  LocalCookingStepDto({
    required this.id,
    required this.title,
    required this.cookingTimeMinutes,
  });
}
