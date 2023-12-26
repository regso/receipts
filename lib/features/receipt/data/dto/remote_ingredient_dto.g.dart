// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIngredientDto _$RemoteIngredientDtoFromJson(Map<String, dynamic> json) =>
    RemoteIngredientDto(
      id: json['id'] as int,
      name: json['name'] as String,
      caloriesForUnit: (json['caloriesForUnit'] as num).toDouble(),
      measureUnitIdModel: RemoteMeasureUnitIdDto.fromJson(
          json['measureUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteIngredientDtoToJson(
        RemoteIngredientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'caloriesForUnit': instance.caloriesForUnit,
      'measureUnit': instance.measureUnitIdModel,
    };

RemoteIngredientIdDto _$RemoteIngredientIdDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteIngredientIdDto(
      id: json['id'] as int,
    );

Map<String, dynamic> _$RemoteIngredientIdDtoToJson(
        RemoteIngredientIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
