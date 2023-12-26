// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_receipt_ingredient_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteReceiptIngredientDto _$RemoteReceiptIngredientDtoFromJson(
        Map<String, dynamic> json) =>
    RemoteReceiptIngredientDto(
      id: json['id'] as int,
      count: json['count'] as int,
      ingredientIdDto: RemoteIngredientIdDto.fromJson(
          json['ingredient'] as Map<String, dynamic>),
      receiptIdDto:
          RemoteReceiptIdDto.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteReceiptIngredientDtoToJson(
        RemoteReceiptIngredientDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'ingredient': instance.ingredientIdDto,
      'recipe': instance.receiptIdDto,
    };
