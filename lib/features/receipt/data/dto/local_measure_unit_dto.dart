import 'package:hive/hive.dart';
import 'package:receipts/features/receipt/data/models/measure_unit_model.dart';

part 'local_measure_unit_dto.g.dart';

@HiveType(typeId: 4)
class LocalMeasureUnitDto {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String one;
  @HiveField(2)
  final String few;
  @HiveField(3)
  final String many;

  LocalMeasureUnitDto({
    required this.id,
    required this.one,
    required this.few,
    required this.many,
  });

  factory LocalMeasureUnitDto.fromMeasureUnitModel(
    MeasureUnitModel model, [
    String? photoUrl,
  ]) {
    return LocalMeasureUnitDto(
      id: model.id,
      one: model.one,
      few: model.few,
      many: model.many,
    );
  }
}
