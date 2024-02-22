import 'dart:typed_data';

import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/favorite_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

abstract interface class AbstractReceiptRepository {
  Future<int?> authenticate(String login, String password);

  Future<ReceiptEntity> findReceipt(int id);

  Future<List<ReceiptEntity>> findReceipts();

  Future<List<ReceiptIngredientEntity>> findReceiptIngredientsByReceipt(
      ReceiptEntity receipt);

  Future<List<CookingStepLinkEntity>> findCookingStepLinksByReceipt(
      ReceiptEntity receipt);

  Future<void> saveFavorite(int receiptId);

  Future<void> deleteFavorite(int favoriteId);

  Future<void> saveCommentByReceipt(
    String text,
    Uint8List photo,
    ReceiptEntity receipt,
  );

  Future<List<FavoriteEntity>> findFavorites();

  Future<List<CommentEntity>> findCommentsByReceipt(ReceiptEntity receipt);
}
