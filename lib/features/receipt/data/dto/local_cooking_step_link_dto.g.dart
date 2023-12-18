// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_cooking_step_link_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCookingStepLinkDtoAdapter
    extends TypeAdapter<LocalCookingStepLinkDto> {
  @override
  final int typeId = 6;

  @override
  LocalCookingStepLinkDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCookingStepLinkDto(
      id: fields[0] as int,
      number: fields[1] as int,
      receiptId: fields[2] as int,
      cookingStepId: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCookingStepLinkDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.receiptId)
      ..writeByte(3)
      ..write(obj.cookingStepId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCookingStepLinkDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
