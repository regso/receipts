import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/domain/usecases/find_comments_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_cooking_step_links_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_ingredients_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';
import 'package:receipts/main.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  ReceiptBloc() : super(InitReceiptState()) {
    on<LoadReceiptEvent>(_load);
    on<ReloadReceiptCommentsEvent>(_loadComments);
  }

  Future<void> _load(LoadReceiptEvent event, Emitter<ReceiptState> emit) async {
    try {
      emit(LoadingReceiptState());
      final receipt = await sl<FindReceiptUseCase>()(id: event.receiptId);
      emit(LoadedReceiptState(
        receipt: receipt,
        receiptIngredients: await sl<FindReceiptIngredientsUseCase>()(
          receipt: receipt,
        ),
        cookingStepLinks: await sl<FindCookingStepLinksUseCase>()(
          receipt: receipt,
        ),
        comments: await sl<FindCommentsUseCase>()(receipt: receipt),
      ));
    } catch (_) {
      emit(ErrorReceiptState());
    }
  }

  Future<void> _loadComments(
    ReloadReceiptCommentsEvent event,
    Emitter<ReceiptState> emit,
  ) async {
    if (state is LoadedReceiptState) {
      emit(LoadedReceiptState(
        receipt: (state as LoadedReceiptState).receipt,
        receiptIngredients: (state as LoadedReceiptState).receiptIngredients,
        cookingStepLinks: (state as LoadedReceiptState).cookingStepLinks,
        comments: await sl<FindCommentsUseCase>()(receipt: event.receipt),
      ));
    }
  }
}
