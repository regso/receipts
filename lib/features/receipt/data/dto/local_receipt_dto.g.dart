// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_receipt_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalReceiptDtoAdapter extends TypeAdapter<LocalReceiptDto> {
  @override
  final int typeId = 0;

  @override
  LocalReceiptDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalReceiptDto(
      id: fields[0] as int,
      title: fields[1] as String,
      cookingTimeMinutes: fields[2] as int,
      photoUrl: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalReceiptDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cookingTimeMinutes)
      ..writeByte(3)
      ..write(obj.photoUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalReceiptDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
