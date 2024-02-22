import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class FindCommentsUseCase {
  final AbstractReceiptRepository receiptRepository;

  FindCommentsUseCase({required this.receiptRepository});

  Future<List<CommentEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.findCommentsByReceipt(receipt);
}
