import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindCommentsUseCase {
  final ReceiptRepository receiptRepository;

  FindCommentsUseCase({required this.receiptRepository});

  Future<List<CommentEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      receiptRepository.findCommentsByReceipt(receipt);
}
