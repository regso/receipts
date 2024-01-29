import 'package:receipts/features/receipt/domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.id,
    required super.receiptId,
    required super.userId,
  });
}
