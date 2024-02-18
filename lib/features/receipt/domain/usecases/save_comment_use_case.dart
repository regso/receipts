import 'dart:typed_data';

import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class SaveCommentUseCase {
  final ReceiptRepository receiptRepository;

  SaveCommentUseCase({required this.receiptRepository});

  Future<void> call({
    required String text,
    required Uint8List photo,
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.saveCommentByReceipt(text, photo, receipt);
}
