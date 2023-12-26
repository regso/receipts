// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_receipt_ingredient_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalReceiptIngredientDtoAdapter
    extends TypeAdapter<LocalReceiptIngredientDto> {
  @override
  final int typeId = 5;

  @override
  LocalReceiptIngredientDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalReceiptIngredientDto(
      id: fields[0] as int,
      count: fields[1] as int,
      ingredientId: fields[2] as int,
      receiptId: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, LocalReceiptIngredientDto obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.ingredientId)
      ..writeByte(3)
      ..write(obj.receiptId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalReceiptIngredientDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
