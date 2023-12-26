import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required super.id,
    required super.text,
    required super.photo,
    required super.createdAt,
    required super.user,
    required super.receipt,
  });
}
