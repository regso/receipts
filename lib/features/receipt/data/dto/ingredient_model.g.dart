// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) =>
    IngredientModel(
      id: json['id'] as int,
      name: json['name'] as String,
      caloriesForUnit: (json['caloriesForUnit'] as num).toDouble(),
      measureUnitIdModel: MeasureUnitIdModel.fromJson(
          json['measureUnit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IngredientModelToJson(IngredientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'caloriesForUnit': instance.caloriesForUnit,
      'measureUnit': instance.measureUnitIdModel,
    };

IngredientIdModel _$IngredientIdModelFromJson(Map<String, dynamic> json) =>
    IngredientIdModel(
      id: json['id'] as int,
    );

Map<String, dynamic> _$IngredientIdModelToJson(IngredientIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
