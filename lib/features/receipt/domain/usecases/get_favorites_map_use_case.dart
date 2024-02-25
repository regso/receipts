import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class GetFavoritesMapUseCase {
  final AbstractReceiptRepository receiptRepository;

  GetFavoritesMapUseCase({required this.receiptRepository});

  // receiptId -> userId -> favoriteId
  Future<Map<int, Map<int, int>>> call() async {
    final favorites = await receiptRepository.findFavorites();
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
