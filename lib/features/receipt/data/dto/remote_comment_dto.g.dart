// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCommentDto _$RemoteCommentDtoFromJson(Map<String, dynamic> json) =>
    RemoteCommentDto(
      id: json['id'] as int,
      text: json['text'] as String,
      photo: json['photo'] as String,
      datetime: json['datetime'] as String,
      userIdDto: RemoteUserIdDto.fromJson(json['user'] as Map<String, dynamic>),
      receiptIdDto:
          RemoteReceiptIdDto.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteCommentDtoToJson(RemoteCommentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'photo': instance.photo,
      'datetime': instance.datetime,
      'user': instance.userIdDto,
      'recipe': instance.receiptIdDto,
    };
