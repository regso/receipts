import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindCookingStepLinksUseCase {
  final ReceiptRepository receiptRepository;

  FindCookingStepLinksUseCase({required this.receiptRepository});

  Future<List<CookingStepLinkEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.findCookingStepLinksByReceipt(receipt);
}
