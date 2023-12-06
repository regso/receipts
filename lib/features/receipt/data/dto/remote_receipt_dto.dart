import 'package:json_annotation/json_annotation.dart';

part 'remote_receipt_dto.g.dart';

@JsonSerializable()
class RemoteReceiptDto {
  final int id;
  final String name;
  final int duration;
  final String photo;

  RemoteReceiptDto({
    required this.id,
    required this.name,
    required this.duration,
    required this.photo,
  });

  factory RemoteReceiptDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteReceiptDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReceiptDtoToJson(this);
}

@JsonSerializable()
class RemoteReceiptDtoIdModel {
  final int id;

  RemoteReceiptDtoIdModel({
    required this.id,
  });

  factory RemoteReceiptDtoIdModel.fromJson(Map<String, dynamic> json) =>
      _$RemoteReceiptDtoIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReceiptDtoIdModelToJson(this);
}
