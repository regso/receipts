import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/domain/usecases/delete_favorite_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_favorite_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  // TODO: DI
  final SaveFavoriteUseCase saveFavoriteUseCase = SaveFavoriteUseCase();
  final DeleteFavoriteUseCase deleteFavoriteUseCase = DeleteFavoriteUseCase();
  final GetFavoritesMapUseCase getFavoritesMapUseCase =
      GetFavoritesMapUseCase();

  HeaderBloc() : super(InitHeaderState()) {
    on<LoadHeaderEvent>(_load);
    on<CheckHeaderEvent>(_check);
    on<UncheckHeaderEvent>(_uncheck);
  }

  Future<void> _load(LoadHeaderEvent event, Emitter<HeaderState> emit) async {
    try {
      int favoritesCount = 0;
      int? favoriteId;

      final favoritesMap = await getFavoritesMapUseCase();
      if (favoritesMap.containsKey(event.receiptId)) {
        favoritesCount = favoritesMap[event.receiptId]!.length;
        if (favoritesMap[event.receiptId]!.containsKey(Constants.appUserId)) {
          favoriteId = favoritesMap[event.receiptId]![Constants.appUserId]!;
        }
      }

      if (favoriteId != null) {
        emit(CheckedHeaderState(count: favoritesCount, favoriteId: favoriteId));
      } else {
        emit(UncheckedHeaderState(count: favoritesCount));
      }
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }

  Future<void> _check(CheckHeaderEvent event, Emitter<HeaderState> emit) async {
    try {
      await saveFavoriteUseCase(receiptId: event.receiptId);
      final favoritesMap = await getFavoritesMapUseCase();
      if (favoritesMap.containsKey(event.receiptId) &&
          favoritesMap[event.receiptId]!.containsKey(Constants.appUserId)) {
        emit(CheckedHeaderState(
          count: favoritesMap[event.receiptId]!.length,
          favoriteId: favoritesMap[event.receiptId]![Constants.appUserId]!,
        ));
      }
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }

  Future<void> _uncheck(
    UncheckHeaderEvent event,
    Emitter<HeaderState> emit,
  ) async {
    try {
      await deleteFavoriteUseCase(favoriteId: event.favoriteId);
      final favoritesMap = await getFavoritesMapUseCase();
      if (favoritesMap.containsKey(event.receiptId)) {
        emit(
          UncheckedHeaderState(count: favoritesMap[event.receiptId]!.length),
        );
      } else {
        emit(UncheckedHeaderState(count: 0));
      }
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }
}
