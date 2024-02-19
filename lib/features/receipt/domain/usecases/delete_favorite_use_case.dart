import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class DeleteFavoriteUseCase {
  final ReceiptRepository receiptRepository;

  DeleteFavoriteUseCase({required this.receiptRepository});

  Future<void> call({required int favoriteId}) async {
    await receiptRepository.deleteFavorite(favoriteId);
  }
}
