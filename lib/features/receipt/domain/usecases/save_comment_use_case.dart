import 'dart:typed_data';

import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class SaveCommentUseCase {
  final AbstractReceiptRepository receiptRepository;

  SaveCommentUseCase({required this.receiptRepository});

  Future<void> call({
    required String text,
    required Uint8List photo,
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.saveCommentByReceipt(text, photo, receipt);
}
