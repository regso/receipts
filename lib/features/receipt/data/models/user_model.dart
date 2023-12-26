import 'package:receipts/features/receipt/data/dto/local_user_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_user_dto.dart';
import 'package:receipts/features/receipt/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel._({
    required super.id,
    required super.login,
    required super.password,
    required super.token,
    required super.avatar,
  });

  factory UserModel.fromRemoteUserDto(RemoteUserDto dto) {
    return UserModel._(
      id: dto.id,
      login: dto.login,
      password: dto.password,
      token: dto.token ?? '',
      avatar: dto.avatar ?? '',
    );
  }

  factory UserModel.fromLocalReceiptDto(LocalUserDto dto) {
    return UserModel._(
      id: dto.id,
      login: dto.login,
      password: dto.password,
      token: dto.token,
      avatar: dto.avatar,
    );
  }
}
