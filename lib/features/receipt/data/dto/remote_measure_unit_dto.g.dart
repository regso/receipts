// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_measure_unit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMeasureUnitDto _$RemoteMeasureUnitDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteMeasureUnitDto(
      id: json['id'] as int,
      one: json['one'] as String,
      few: json['few'] as String,
      many: json['many'] as String,
    );

Map<String, dynamic> _$RemoteMeasureUnitDtoToJson(
        RemoteMeasureUnitDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'one': instance.one,
      'few': instance.few,
      'many': instance.many,
    };

RemoteMeasureUnitIdDto _$RemoteMeasureUnitIdDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteMeasureUnitIdDto(
      id: json['id'] as int,
    );

Map<String, dynamic> _$RemoteMeasureUnitIdDtoToJson(
        RemoteMeasureUnitIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
