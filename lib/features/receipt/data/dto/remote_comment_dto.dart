import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_user_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';

part 'remote_comment_dto.g.dart';

@JsonSerializable()
class RemoteCommentDto {
  final int id;
  final String text;
  final String photo;
  final String datetime;
  @JsonKey(name: 'user')
  final RemoteUserIdDto userIdDto;
  @JsonKey(name: 'recipe')
  final RemoteReceiptIdDto receiptIdDto;

  RemoteCommentDto({
    required this.id,
    required this.text,
    required this.photo,
    required this.datetime,
    required this.userIdDto,
    required this.receiptIdDto,
  });

  factory RemoteCommentDto.fromModel(CommentModel model) {
    return RemoteCommentDto(
      id: model.id,
      text: model.text,
      photo: model.photo,
      datetime: model.createdAt,
      userIdDto: RemoteUserIdDto(id: model.userId),
      receiptIdDto: RemoteReceiptIdDto(id: model.receiptId),
    );
  }

  factory RemoteCommentDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteCommentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCommentDtoToJson(this);
}
