import 'package:hive/hive.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';

part 'cooking_step_model.g.dart';

@HiveType(typeId: 2)
class CookingStepModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final int cookingTimeMinutes;

  CookingStepModel({
    required this.id,
    required this.number,
    required this.title,
    required this.cookingTimeMinutes,
  });

  factory CookingStepModel.fromRemoteCookingStepDtoAndNumber(
    RemoteCookingStepDto dto,
    int number,
  ) {
    return CookingStepModel(
      id: dto.id,
      number: number,
      title: dto.name,
      cookingTimeMinutes: dto.duration,
    );
  }
}
