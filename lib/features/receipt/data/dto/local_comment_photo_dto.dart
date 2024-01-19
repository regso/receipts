import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'local_comment_photo_dto.g.dart';

@HiveType(typeId: 8)
class LocalCommentPhotoDto {
  @HiveField(0)
  final int commentId;
  @HiveField(1)
  final Uint8List photo;

  LocalCommentPhotoDto({
    required this.commentId,
    required this.photo,
  });
}
