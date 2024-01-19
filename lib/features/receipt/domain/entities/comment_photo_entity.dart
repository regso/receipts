import 'dart:typed_data';

class CommentPhotoEntity {
  final int commentId;
  final Uint8List photo;

  CommentPhotoEntity({
    required this.commentId,
    required this.photo,
  });
}
