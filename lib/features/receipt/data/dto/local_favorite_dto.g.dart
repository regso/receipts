// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_favorite_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalFavoriteDtoAdapter extends TypeAdapter<LocalFavoriteDto> {
  @override
  final int typeId = 9;

  @override
  LocalFavoriteDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalFavoriteDto(
      id: fields[0] as int,
      receiptId: fields[1] as int,
      userId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalFavoriteDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.receiptId)
      ..writeByte(2)
      ..write(obj.userId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalFavoriteDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
