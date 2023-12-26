import 'package:json_annotation/json_annotation.dart';

part 'remote_user_dto.g.dart';

@JsonSerializable()
class RemoteUserDto {
  final int id;
  final String login;
  final String password;
  final String? token;
  final String? avatar;

  RemoteUserDto({
    required this.id,
    required this.login,
    required this.password,
    required this.token,
    required this.avatar,
  });

  factory RemoteUserDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserDtoToJson(this);
}

@JsonSerializable()
class RemoteUserIdDto {
  final int id;

  RemoteUserIdDto({
    required this.id,
  });

  factory RemoteUserIdDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserIdDtoToJson(this);
}
