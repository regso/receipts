import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(InitHeaderState()) {
    on<LoadHeaderEvent>(_load);
    on<CheckHeaderEvent>(_check);
    on<UncheckHeaderEvent>(_uncheck);
  }

  Future<void> _load(LoadHeaderEvent event, Emitter<HeaderState> emit) async {
    try {
      if (event.favoriteId != null) {
        emit(
          CheckedHeaderState(count: event.count, favoriteId: event.favoriteId!),
        );
      } else {
        emit(UncheckedHeaderState(count: event.count));
      }
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }

  Future<void> _check(CheckHeaderEvent event, Emitter<HeaderState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      event.receiptId;
      emit(CheckedHeaderState(count: 10, favoriteId: 11));
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }

  Future<void> _uncheck(
    UncheckHeaderEvent event,
    Emitter<HeaderState> emit,
  ) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      event.favoriteId;
      emit(UncheckedHeaderState(count: 20));
    } catch (_) {
      emit(ErrorHeaderState());
    }
  }
}
