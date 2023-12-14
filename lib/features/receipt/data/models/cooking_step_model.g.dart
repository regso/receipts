// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cooking_step_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CookingStepModelAdapter extends TypeAdapter<CookingStepModel> {
  @override
  final int typeId = 2;

  @override
  CookingStepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CookingStepModel(
      id: fields[0] as int,
      number: fields[1] as int,
      title: fields[2] as String,
      cookingTimeMinutes: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CookingStepModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.cookingTimeMinutes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CookingStepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
