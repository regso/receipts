// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFavoriteDto _$RemoteFavoriteDtoFromJson(Map<String, dynamic> json) =>
    RemoteFavoriteDto(
      id: json['id'] as int,
      receiptIdDto:
          RemoteReceiptIdDto.fromJson(json['recipe'] as Map<String, dynamic>),
      userIdDto: RemoteUserIdDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteFavoriteDtoToJson(RemoteFavoriteDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.receiptIdDto,
      'user': instance.userIdDto,
    };
