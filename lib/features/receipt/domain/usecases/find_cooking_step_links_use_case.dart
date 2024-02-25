import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class FindCookingStepLinksUseCase {
  final AbstractReceiptRepository receiptRepository;

  FindCookingStepLinksUseCase({required this.receiptRepository});

  Future<List<CookingStepLinkEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.findCookingStepLinksByReceipt(receipt);
}
