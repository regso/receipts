import 'dart:typed_data';

import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class SaveCommentUseCase {
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<void> call({
    required String text,
    required Uint8List photo,
    required ReceiptEntity receipt,
  }) =>
      _receiptRepository.saveCommentByReceipt(text, photo, receipt);
}
