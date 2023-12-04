// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      id: json['id'] as int,
      name: json['name'] as String,
      amount: json['amount'] as String,
      caloriesForUnit: json['caloriesForUnit'] as int,
      measureUnit:
          MeasureUnit.fromJson(json['measureUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'caloriesForUnit': instance.caloriesForUnit,
      'measureUnit': instance.measureUnit,
    };
