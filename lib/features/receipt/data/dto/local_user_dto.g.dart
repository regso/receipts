// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalUserDtoAdapter extends TypeAdapter<LocalUserDto> {
  @override
  final int typeId = 7;

  @override
  LocalUserDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalUserDto(
      id: fields[0] as int,
      login: fields[1] as String,
      password: fields[2] as String,
      token: fields[3] as String,
      avatar: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalUserDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.login)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.token)
      ..writeByte(4)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalUserDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
