// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_measure_unit_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalMeasureUnitDtoAdapter extends TypeAdapter<LocalMeasureUnitDto> {
  @override
  final int typeId = 4;

  @override
  LocalMeasureUnitDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalMeasureUnitDto(
      id: fields[0] as int,
      one: fields[1] as String,
      few: fields[2] as String,
      many: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalMeasureUnitDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.one)
      ..writeByte(2)
      ..write(obj.few)
      ..writeByte(3)
      ..write(obj.many);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalMeasureUnitDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
