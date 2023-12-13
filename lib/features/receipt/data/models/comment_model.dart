import 'package:intl/intl.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';

class CommentModel {
  final int id;
  final String text;
  final String photo;
  final String createdAt;
  final int userId;
  final int receiptId;

  CommentModel._({
    required this.id,
    required this.text,
    required this.photo,
    required this.createdAt,
    required this.userId,
    required this.receiptId,
  });

  factory CommentModel.fromProperties({
    required String text,
    required String photo,
    required int receiptId,
  }) {
    return CommentModel._(
      id: 0,
      text: text,
      photo: photo,
      createdAt:
          DateFormat("yyyy-MM-ddTHH:mm:ss.S'Z'").format(DateTime.now().toUtc()),
      userId: Constants.appUserId,
      receiptId: receiptId,
    );
  }

  factory CommentModel.fromRemoteCommentDto(RemoteCommentDto dto) {
    return CommentModel._(
      id: dto.id,
      text: dto.text,
      photo: dto.photo,
      createdAt: dto.datetime,
      userId: dto.userIdDto.id,
      receiptId: dto.receiptIdDto.id,
    );
  }
}
