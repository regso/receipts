import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';

part 'remote_receipt_ingredient_dto.g.dart';

@JsonSerializable()
class RemoteReceiptIngredientDto {
  final int id;
  final int count;
  @JsonKey(name: 'ingredient')
  final RemoteIngredientIdDto ingredientIdDto;
  @JsonKey(name: 'recipe')
  final RemoteReceiptIdDto receiptIdDto;

  RemoteReceiptIngredientDto({
    required this.id,
    required this.count,
    required this.ingredientIdDto,
    required this.receiptIdDto,
  });

  factory RemoteReceiptIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteReceiptIngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReceiptIngredientDtoToJson(this);
}
