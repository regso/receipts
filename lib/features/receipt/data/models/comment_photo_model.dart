import 'package:receipts/features/receipt/data/dto/local_comment_photo_dto.dart';
import 'package:receipts/features/receipt/domain/entities/comment_photo_entity.dart';

class CommentPhotoModel extends CommentPhotoEntity {
  CommentPhotoModel._({
    required super.commentId,
    required super.photo,
  });

  factory CommentPhotoModel.fromLocalCommentPhotoDto(
    LocalCommentPhotoDto dto,
  ) {
    return CommentPhotoModel._(
      commentId: dto.commentId,
      photo: dto.photo,
    );
  }
}
