import 'package:hive/hive.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

part 'local_receipt_dto.g.dart';

@HiveType(typeId: 0)
class LocalReceiptDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int cookingTimeMinutes;
  @HiveField(3)
  final String photoUrl;

  LocalReceiptDto({
    required this.id,
    required this.title,
    required this.cookingTimeMinutes,
    required this.photoUrl,
  });

  factory LocalReceiptDto.fromModelAndPhotoUrl(
    ReceiptModel model, [
    String? photoUrl,
  ]) {
    return LocalReceiptDto(
      id: model.id,
      title: model.title,
      cookingTimeMinutes: model.cookingTimeMinutes,
      photoUrl: photoUrl ?? model.photoUrl,
    );
  }
}
