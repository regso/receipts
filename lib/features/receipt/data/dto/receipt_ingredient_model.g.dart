// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptIngredientModel _$ReceiptIngredientModelFromJson(
        Map<String, dynamic> json) =>
    ReceiptIngredientModel(
      id: json['id'] as int,
      count: json['count'] as int,
      ingredientIdModel: IngredientIdModel.fromJson(
          json['ingredient'] as Map<String, dynamic>),
      receiptIdModel: RemoteReceiptDtoIdModel.fromJson(
          json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiptIngredientModelToJson(
        ReceiptIngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'ingredient': instance.ingredientIdModel,
      'recipe': instance.receiptIdModel,
    };
