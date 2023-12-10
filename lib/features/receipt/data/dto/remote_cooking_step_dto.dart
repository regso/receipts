import 'package:json_annotation/json_annotation.dart';

part 'remote_cooking_step_dto.g.dart';

@JsonSerializable()
class RemoteCookingStepDto {
  final int id;
  final String name;
  final int duration;

  RemoteCookingStepDto({
    required this.id,
    required this.name,
    required this.duration,
  });

  factory RemoteCookingStepDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteCookingStepDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCookingStepDtoToJson(this);
}

@JsonSerializable()
class RemoteCookingStepIdDto {
  final int id;

  RemoteCookingStepIdDto({
    required this.id,
  });

  factory RemoteCookingStepIdDto.fromJson(Map<String, dynamic> json) =>
      _$RemoteCookingStepIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCookingStepIdDtoToJson(this);
}
