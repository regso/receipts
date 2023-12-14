import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';

part 'comment_model.g.dart';

@HiveType(typeId: 3)
class CommentModel {
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
  @HiveField(6)
  final bool isOnline;

  CommentModel({
    required this.id,
    required this.text,
    required this.photo,
    required this.createdAt,
    required this.userId,
    required this.receiptId,
    required this.isOnline,
  });

  factory CommentModel.fromProperties({
    required String text,
    required String photo,
    required int receiptId,
  }) {
    return CommentModel(
      id: 0,
      text: text,
      photo: photo,
      createdAt:
          DateFormat("yyyy-MM-ddTHH:mm:ss.S'Z'").format(DateTime.now().toUtc()),
      userId: Constants.appUserId,
      receiptId: receiptId,
      isOnline: false,
    );
  }

  factory CommentModel.fromRemoteCommentDto(RemoteCommentDto dto) {
    return CommentModel(
      id: dto.id,
      text: dto.text,
      photo: dto.photo,
      createdAt: dto.datetime,
      userId: dto.userIdDto.id,
      receiptId: dto.receiptIdDto.id,
      isOnline: true,
    );
  }
}
