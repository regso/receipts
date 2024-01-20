// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_comment_photo_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCommentPhotoDtoAdapter extends TypeAdapter<LocalCommentPhotoDto> {
  @override
  final int typeId = 8;

  @override
  LocalCommentPhotoDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCommentPhotoDto(
      commentId: fields[0] as int,
      photo: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, LocalCommentPhotoDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.commentId)
      ..writeByte(1)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCommentPhotoDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
