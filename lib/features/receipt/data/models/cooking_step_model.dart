import 'package:receipts/features/receipt/data/dto/local_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_entity.dart';

class CookingStepModel extends CookingStepEntity {
  CookingStepModel._({
    required super.id,
    required super.title,
    required super.cookingTimeMinutes,
  });

  factory CookingStepModel.fromRemoteCookingStepDto(RemoteCookingStepDto dto) {
    return CookingStepModel._(
      id: dto.id,
      title: dto.name,
      cookingTimeMinutes: dto.duration,
    );
  }

  factory CookingStepModel.fromLocalCookingStepDto(LocalCookingStepDto dto) {
    return CookingStepModel._(
      id: dto.id,
      title: dto.title,
      cookingTimeMinutes: dto.cookingTimeMinutes,
    );
  }
}
