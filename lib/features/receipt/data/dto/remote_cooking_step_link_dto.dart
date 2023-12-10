import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';

part 'remote_cooking_step_link_dto.g.dart';

@JsonSerializable()
class RemoteCookingStepLinkDto {
  final int id;
  final int number;
  @JsonKey(name: 'recipe')
  final RemoteReceiptIdDto receiptIdDto;
  @JsonKey(name: 'step')
  final RemoteCookingStepIdDto cookingStepIdDto;

  RemoteCookingStepLinkDto({
    required this.id,
    required this.number,
    required this.receiptIdDto,
    required this.cookingStepIdDto,
  });

  factory RemoteCookingStepLinkDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteCookingStepLinkDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCookingStepLinkDtoToJson(this);
}
