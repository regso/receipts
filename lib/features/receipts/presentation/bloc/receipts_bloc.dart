import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_event.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_state.dart';

class ReceiptsBloc extends Bloc<ReceiptsEvent, ReceiptsState>{
  ReceiptsBloc(): super(const ReceiptsState([])) {
    on<LoadReceiptsEvent>(_load);
  }

  void _load(LoadReceiptsEvent event, Emitter<ReceiptsState> emit) {
    ReceiptsState newState = const ReceiptsState([]);
    emit(newState);
  }
}