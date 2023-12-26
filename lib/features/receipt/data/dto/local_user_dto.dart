import 'package:hive/hive.dart';

part 'local_user_dto.g.dart';

@HiveType(typeId: 7)
class LocalUserDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String login;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String token;
  @HiveField(4)
  final String avatar;

  LocalUserDto({
    required this.id,
    required this.login,
    required this.password,
    required this.token,
    required this.avatar,
  });
}
