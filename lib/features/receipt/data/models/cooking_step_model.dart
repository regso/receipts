import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';

class CookingStepModel {
  final int id;
  final int number;
  final String title;
  final int cookingTimeMinutes;

  CookingStepModel._({
    required this.id,
    required this.number,
    required this.title,
    required this.cookingTimeMinutes,
  });

  factory CookingStepModel.fromRemoteCookingStepDtoAndNumber(
    RemoteCookingStepDto dto,
    int number,
  ) {
    return CookingStepModel._(
      id: dto.id,
      number: number,
      title: dto.name,
      cookingTimeMinutes: dto.duration,
    );
  }
}
