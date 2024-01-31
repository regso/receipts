import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipts_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_event.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState> {
  // TODO: DI
  final FindReceiptsUseCase findReceiptsUseCase = FindReceiptsUseCase();
  final GetFavoritesMapUseCase getFavoritesMapUseCase =
      GetFavoritesMapUseCase();

  ReceiptsBloc() : super(const InitReceiptsState()) {
    on<LoadReceiptsEvent>(_load);
  }

  void _load(LoadReceiptsEvent event, Emitter<ReceiptsState> emit) async {
    try {
      emit(const LoadingReceiptsState());
      emit(LoadedReceiptsState(
        receipts: await findReceiptsUseCase(),
        favoritesMap: await getFavoritesMapUseCase(),
      ));
    } catch (_) {
      emit(const ErrorReceiptsState());
    }
  }
}
