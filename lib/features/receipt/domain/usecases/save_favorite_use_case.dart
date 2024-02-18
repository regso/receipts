import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class SaveFavoriteUseCase {
  final ReceiptRepository receiptRepository;

  SaveFavoriteUseCase({required this.receiptRepository});

  Future<void> call({required int receiptId}) =>
      receiptRepository.saveFavorite(receiptId);
}
