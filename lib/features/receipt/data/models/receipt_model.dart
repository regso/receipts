import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptModel extends ReceiptEntity {
  ReceiptModel._({
    required super.id,
    required super.title,
    required super.cookingTimeMinutes,
    required super.photoUrl,
  });

  factory ReceiptModel.fromRemoteReceiptDto(RemoteReceiptDto dto) {
    return ReceiptModel._(
      id: dto.id,
      title: dto.name,
      cookingTimeMinutes: dto.duration,
      photoUrl: dto.photo,
    );
  }

  factory ReceiptModel.fromLocalReceiptDto(LocalReceiptDto dto) {
    return ReceiptModel._(
      id: dto.id,
      title: dto.title,
      cookingTimeMinutes: dto.cookingTimeMinutes,
      photoUrl: dto.photoUrl,
    );
  }
}
