class UserEntity {
  final int id;
  final String login;
  final String password;
  final String token;
  final String avatar;

  UserEntity({
    required this.id,
    required this.login,
    required this.password,
    required this.token,
    required this.avatar,
  });
}
