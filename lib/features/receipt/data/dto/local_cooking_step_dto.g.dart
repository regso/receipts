// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_cooking_step_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCookingStepDtoAdapter extends TypeAdapter<LocalCookingStepDto> {
  @override
  final int typeId = 2;

  @override
  LocalCookingStepDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCookingStepDto(
      id: fields[0] as int,
      title: fields[1] as String,
      cookingTimeMinutes: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCookingStepDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cookingTimeMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCookingStepDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
