import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class GetFavoritesMapUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  // receiptId -> userId -> favoriteId
  Future<Map<int, Map<int, int>>> call() async {
    final favorites = await _receiptRepository.findFavorites();
    Map<int, Map<int, int>> favoritesMap = {};
    for (final favorite in favorites) {
      if (favoritesMap.containsKey(favorite.receiptId)) {
        favoritesMap[favorite.receiptId]![favorite.userId] = favorite.id;
      } else {
        favoritesMap[favorite.receiptId] = {favorite.userId: favorite.id};
      }
    }
    return favoritesMap;
  }
}
