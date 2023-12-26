// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_ingredient_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalIngredientDtoAdapter extends TypeAdapter<LocalIngredientDto> {
  @override
  final int typeId = 1;

  @override
  LocalIngredientDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalIngredientDto(
      id: fields[0] as int,
      title: fields[1] as String,
      measureUnitId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalIngredientDto obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.measureUnitId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalIngredientDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
