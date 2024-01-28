import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class GetFavoritesMapUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<Map<int, bool>> call() async {
    final favorites = await _receiptRepository.findFavorites();
    Map<int, bool> favoritesMap = {};
    for (final favorite in favorites) {
      favoritesMap[favorite.receiptId] = true;
    }
    return favoritesMap;
  }
}
