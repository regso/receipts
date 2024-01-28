import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class DeleteFavoriteUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<void> call({
    required int favoriteId,
  }) async {
    _receiptRepository.deleteFavorite(favoriteId);
  }
}
