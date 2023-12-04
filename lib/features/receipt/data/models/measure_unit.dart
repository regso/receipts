import 'package:json_annotation/json_annotation.dart';

part 'measure_unit.g.dart';

@JsonSerializable()
class MeasureUnit {
  final int id;
  final String one;
  final String few;
  final String many;

  MeasureUnit({
    required this.id,
    required this.one,
    required this.few,
    required this.many,
  });

  factory MeasureUnit.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitToJson(this);
}
