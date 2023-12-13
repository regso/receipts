// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUserDto _$RemoteUserDtoFromJson(Map<String, dynamic> json) =>
    RemoteUserDto(
      id: json['id'] as int,
      login: json['login'] as String,
      password: json['password'] as String,
      token: json['token'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$RemoteUserDtoToJson(RemoteUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'password': instance.password,
      'token': instance.token,
      'avatar': instance.avatar,
    };

RemoteUserIdDto _$RemoteUserIdDtoFromJson(Map<String, dynamic> json) =>
    RemoteUserIdDto(
      id: json['id'] as int,
    );

Map<String, dynamic> _$RemoteUserIdDtoToJson(RemoteUserIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
