import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class SaveFavoriteUseCase {
  final AbstractReceiptRepository receiptRepository;

  SaveFavoriteUseCase({required this.receiptRepository});

  Future<void> call({required int receiptId}) =>
      receiptRepository.saveFavorite(receiptId);
}
