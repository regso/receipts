// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) => ReceiptModel(
      id: json['id'] as int,
      name: json['name'] as String,
      duration: json['duration'] as int,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'photo': instance.photo,
    };

ReceiptIdModel _$ReceiptIdModelFromJson(Map<String, dynamic> json) =>
    ReceiptIdModel(
      id: json['id'] as int,
    );

Map<String, dynamic> _$ReceiptIdModelToJson(ReceiptIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
