import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class GetReceiptCaloriesUseCase {
  final AbstractReceiptRepository receiptRepository;

  GetReceiptCaloriesUseCase({required this.receiptRepository});

  Future<double> call({required ReceiptEntity receipt}) async {
    final receiptIngredients =
        await receiptRepository.findReceiptIngredientsByReceipt(
      receipt,
    );
    double calories = receiptIngredients.fold(
      0,
      (prev, item) => prev + item.count * item.ingredient.caloriesForUnit,
    );
    return calories;
  }
}
