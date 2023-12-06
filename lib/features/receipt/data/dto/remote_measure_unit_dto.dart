import 'package:json_annotation/json_annotation.dart';

part 'remote_measure_unit_dto.g.dart';

@JsonSerializable()
class RemoteMeasureUnitDto {
  final int id;
  final String one;
  final String few;
  final String many;

  RemoteMeasureUnitDto({
    required this.id,
    required this.one,
    required this.few,
    required this.many,
  });

  factory RemoteMeasureUnitDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteMeasureUnitDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMeasureUnitDtoToJson(this);
}

@JsonSerializable()
class RemoteMeasureUnitIdDto{
  final int id;

  RemoteMeasureUnitIdDto({required this.id});

  factory RemoteMeasureUnitIdDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteMeasureUnitIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMeasureUnitIdDtoToJson(this);
}