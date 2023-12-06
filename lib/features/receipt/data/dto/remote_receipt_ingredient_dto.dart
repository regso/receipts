import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';

part 'remote_receipt_ingredient_dto.g.dart';

@JsonSerializable()
class RemoteReceiptIngredientDto {
  final int id;
  final int count;
  @JsonKey(name: 'ingredient')
  final RemoteIngredientIdDto ingredientIdModel;
  @JsonKey(name: 'recipe')
  final RemoteReceiptDtoIdModel receiptIdModel;

  RemoteReceiptIngredientDto({
    required this.id,
    required this.count,
    required this.ingredientIdModel,
    required this.receiptIdModel,
  });

  factory RemoteReceiptIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteReceiptIngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReceiptIngredientDtoToJson(this);
}
