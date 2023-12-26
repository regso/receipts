import 'package:hive/hive.dart';

part 'local_comment_dto.g.dart';

@HiveType(typeId: 3)
class LocalCommentDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final String photo;
  @HiveField(3)
  final String createdAt;
  @HiveField(4)
  final int userId;
  @HiveField(5)
  final int receiptId;

  LocalCommentDto({
    required this.id,
    required this.text,
    required this.photo,
    required this.createdAt,
    required this.userId,
    required this.receiptId,
  });
}
