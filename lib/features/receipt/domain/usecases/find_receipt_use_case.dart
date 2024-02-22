import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class FindReceiptUseCase {
  final AbstractReceiptRepository receiptRepository;

  FindReceiptUseCase({required this.receiptRepository});

  Future<ReceiptEntity> call({required int id}) =>
      receiptRepository.findReceipt(id);
}
