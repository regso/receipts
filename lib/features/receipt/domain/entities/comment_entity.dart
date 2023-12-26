import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/user_entity.dart';

class CommentEntity {
  final int id;
  final String text;
  final String photo;
  final String createdAt;
  final UserEntity user;
  final ReceiptEntity receipt;

  CommentEntity({
    required this.id,
    required this.text,
    required this.photo,
    required this.createdAt,
    required this.user,
    required this.receipt,
  });
}
