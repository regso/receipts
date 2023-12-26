import 'package:hive/hive.dart';

part 'local_cooking_step_link_dto.g.dart';

@HiveType(typeId: 6)
class LocalCookingStepLinkDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int number;
  @HiveField(2)
  final int receiptId;
  @HiveField(3)
  final int cookingStepId;

  LocalCookingStepLinkDto({
    required this.id,
    required this.number,
    required this.receiptId,
    required this.cookingStepId,
  });
}
