// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_comment_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCommentDtoAdapter extends TypeAdapter<LocalCommentDto> {
  @override
  final int typeId = 3;

  @override
  LocalCommentDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCommentDto(
      id: fields[0] as int,
      text: fields[1] as String,
      photo: fields[2] as String,
      createdAt: fields[3] as String,
      userId: fields[4] as int,
      receiptId: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCommentDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.receiptId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCommentDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
