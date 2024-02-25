import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class FindReceiptIngredientsUseCase {
  final AbstractReceiptRepository receiptRepository;

  FindReceiptIngredientsUseCase({required this.receiptRepository});

  Future<List<ReceiptIngredientEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.findReceiptIngredientsByReceipt(receipt);
}
