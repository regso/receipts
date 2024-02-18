import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipts_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_event.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_state.dart';
import 'package:receipts/main.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  ReceiptsBloc() : super(const InitReceiptsState()) {
    on<LoadReceiptsEvent>(_load);
  }

  void _load(LoadReceiptsEvent event, Emitter<ReceiptsState> emit) async {
    try {
      emit(const LoadingReceiptsState());
      final receipts = await sl<FindReceiptsUseCase>()();
      final favoritesMap = await sl<GetFavoritesMapUseCase>()();
      if (event.isFavorites && event.userId is int) {
        List<int> userFavoritesReceiptIds = [];
        favoritesMap.forEach((
          int receiptId,
          Map<int, int> favoriteIdByUserIdMap,
        ) {
          favoriteIdByUserIdMap.forEach((userId, favoriteId) {
            if (userId == event.userId) {
              userFavoritesReceiptIds.add(receiptId);
            }
          });
        });
        emit(LoadedReceiptsState(
          receipts: receipts
              .where(
                (ReceiptEntity receipt) =>
                    userFavoritesReceiptIds.contains(receipt.id),
              )
              .toList(),
          favoritesMap: favoritesMap,
        ));
      } else {
        emit(LoadedReceiptsState(
          receipts: receipts,
          favoritesMap: favoritesMap,
        ));
      }
    } catch (_) {
      emit(const ErrorReceiptsState());
    }
  }
}
