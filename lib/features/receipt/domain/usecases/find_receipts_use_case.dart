import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class FindReceiptsUseCase {
  final AbstractReceiptRepository receiptRepository;

  FindReceiptsUseCase({required this.receiptRepository});

  Future<List<ReceiptEntity>> call() => receiptRepository.findReceipts();
}
