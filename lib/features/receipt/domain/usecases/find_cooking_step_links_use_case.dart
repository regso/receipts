import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindCookingStepLinksUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<List<CookingStepLinkEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      _receiptRepository.findCookingStepLinksByReceipt(receipt);
}
