import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

class FindReceiptIngredientsUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<List<ReceiptIngredientEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      _receiptRepository.findReceiptIngredientsByReceipt(receipt);
}
