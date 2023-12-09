// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_receipt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteReceiptDto _$RemoteReceiptDtoFromJson(Map<String, dynamic> json) =>
    RemoteReceiptDto(
      id: json['id'] as int,
      name: json['name'] as String,
      duration: json['duration'] as int,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$RemoteReceiptDtoToJson(RemoteReceiptDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'photo': instance.photo,
    };

RemoteReceiptIdDto _$RemoteReceiptDtoIdModelFromJson(
        Map<String, dynamic> json) =>
    RemoteReceiptIdDto(
      id: json['id'] as int,
    );

Map<String, dynamic> _$RemoteReceiptDtoIdModelToJson(
        RemoteReceiptIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
