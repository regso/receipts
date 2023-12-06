import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';

part 'remote_ingredient_dto.g.dart';

@JsonSerializable()
class RemoteIngredientDto {
  final int id;
  final String name;
  final double caloriesForUnit;
  @JsonKey(name: 'measureUnit')
  final RemoteMeasureUnitIdDto measureUnitIdModel;

  RemoteIngredientDto({
    required this.id,
    required this.name,
    required this.caloriesForUnit,
    required this.measureUnitIdModel,
  });

  factory RemoteIngredientDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteIngredientDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIngredientDtoToJson(this);
}

@JsonSerializable()
class RemoteIngredientIdDto {
  final int id;

  RemoteIngredientIdDto({
    required this.id,
  });

  factory RemoteIngredientIdDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteIngredientIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIngredientIdDtoToJson(this);
}
