import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class SaveFavoriteUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<void> call({
    required int receiptId,
  }) async {
    // TODO
    _receiptRepository.saveFavorite(receiptId);
  }
}
