import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_user_dto.dart';

part 'remote_favorite_dto.g.dart';

@JsonSerializable()
class RemoteFavoriteDto {
  final int id;
  @JsonKey(name: 'recipe')
  final RemoteReceiptIdDto receiptIdDto;
  @JsonKey(name: 'user')
  final RemoteUserIdDto userIdDto;

  RemoteFavoriteDto({
    required this.id,
    required this.receiptIdDto,
    required this.userIdDto,
  });

  factory RemoteFavoriteDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteFavoriteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteFavoriteDtoToJson(this);
}