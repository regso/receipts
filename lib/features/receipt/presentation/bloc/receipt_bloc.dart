import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/domain/usecases/find_comments_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_cooking_step_links_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_ingredients_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  // TODO: DI
  final FindReceiptIngredientsUseCase findReceiptIngredientsUseCase =
      FindReceiptIngredientsUseCase();
  final FindCookingStepLinksUseCase findCookingStepLinksUseCase =
      FindCookingStepLinksUseCase();
  final FindCommentsUseCase findCommentsUseCase = FindCommentsUseCase();

  ReceiptBloc() : super(InitReceiptState()) {
    on<LoadReceiptEvent>(_load);
    on<ReloadReceiptCommentsEvent>(_loadComments);
  }

  Future<void> _load(LoadReceiptEvent event, Emitter<ReceiptState> emit) async {
    try {
      emit(LoadingReceiptState());
      emit(LoadedReceiptState(
        receiptIngredients: await findReceiptIngredientsUseCase(
          receipt: event.receipt,
        ),
        cookingStepLinks: await findCookingStepLinksUseCase(
          receipt: event.receipt,
        ),
        comments: await findCommentsUseCase(receipt: event.receipt),
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
        receiptIngredients: (state as LoadedReceiptState).receiptIngredients,
        cookingStepLinks: (state as LoadedReceiptState).cookingStepLinks,
        comments: await findCommentsUseCase(receipt: event.receipt),
      ));
    }
  }
}
