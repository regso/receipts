import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindReceiptUseCase {
  final ReceiptRepository receiptRepository;

  FindReceiptUseCase({required this.receiptRepository});

  Future<ReceiptEntity> call({required int id}) =>
      receiptRepository.findReceipt(id);
}
