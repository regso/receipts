// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_cooking_step_link_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCookingStepLinkDto _$RemoteCookingStepLinkDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteCookingStepLinkDto(
      id: json['id'] as int,
      number: json['number'] as int,
      receiptIdDto:
          RemoteReceiptIdDto.fromJson(json['recipe'] as Map<String, dynamic>),
      cookingStepIdDto:
          RemoteCookingStepIdDto.fromJson(json['step'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteCookingStepLinkDtoToJson(
        RemoteCookingStepLinkDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'recipe': instance.receiptIdDto,
      'step': instance.cookingStepIdDto,
    };
