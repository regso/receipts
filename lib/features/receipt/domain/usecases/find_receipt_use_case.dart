import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindReceiptUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<ReceiptEntity> call({required int id}) =>
      _receiptRepository.findReceipt(id);
}
