import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindReceiptsUseCase {
  final ReceiptRepository receiptRepository;

  FindReceiptsUseCase({required this.receiptRepository});

  Future<List<ReceiptEntity>> call() => receiptRepository.findReceipts();
}
