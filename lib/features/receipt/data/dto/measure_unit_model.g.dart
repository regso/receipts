// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureUnitModel _$MeasureUnitModelFromJson(Map<String, dynamic> json) =>
    MeasureUnitModel(
      id: json['id'] as int,
      one: json['one'] as String,
      few: json['few'] as String,
      many: json['many'] as String,
    );

Map<String, dynamic> _$MeasureUnitModelToJson(MeasureUnitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'one': instance.one,
      'few': instance.few,
      'many': instance.many,
    };

MeasureUnitIdModel _$MeasureUnitIdModelFromJson(Map<String, dynamic> json) =>
    MeasureUnitIdModel(
      id: json['id'] as int,
    );

Map<String, dynamic> _$MeasureUnitIdModelToJson(MeasureUnitIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
