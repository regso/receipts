import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class DeleteFavoriteUseCase {
  final AbstractReceiptRepository receiptRepository;

  DeleteFavoriteUseCase({required this.receiptRepository});

  Future<void> call({required int favoriteId}) async {
    await receiptRepository.deleteFavorite(favoriteId);
  }
}
