// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_cooking_step_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCookingStepDto _$RemoteCookingStepDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteCookingStepDto(
      id: json['id'] as int,
      name: json['name'] as String,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$RemoteCookingStepDtoToJson(
        RemoteCookingStepDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
    };

RemoteCookingStepIdDto _$RemoteCookingStepIdDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteCookingStepIdDto(
      id: json['id'] as int,
    );

Map<String, dynamic> _$RemoteCookingStepIdDtoToJson(
        RemoteCookingStepIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
