import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class FindCommentsUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<List<CommentEntity>> call({
    required ReceiptEntity receipt,
  }) =>
      _receiptRepository.findCommentsByReceipt(receipt);
}
