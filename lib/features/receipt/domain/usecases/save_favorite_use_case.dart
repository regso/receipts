import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/favorite_entity.dart';

class SaveFavoriteUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<void> call({
    required int receiptId,
  }) async {
    _receiptRepository.saveFavorite(
      FavoriteEntity(id: 0, receiptId: receiptId),
    );
  }
}
