import 'package:json_annotation/json_annotation.dart';

part 'measure_unit_model.g.dart';

@JsonSerializable()
class MeasureUnitModel {
  final int id;
  final String one;
  final String few;
  final String many;

  MeasureUnitModel({
    required this.id,
    required this.one,
    required this.few,
    required this.many,
  });

  factory MeasureUnitModel.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitModelToJson(this);
}

@JsonSerializable()
class MeasureUnitIdModel{
  final int id;

  MeasureUnitIdModel({required this.id});

  factory MeasureUnitIdModel.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitIdModelToJson(this);
}