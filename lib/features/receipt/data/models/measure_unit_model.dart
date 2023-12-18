import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';

class MeasureUnitModel extends MeasureUnitEntity {
  MeasureUnitModel._({
    required super.id,
    required super.one,
    required super.few,
    required super.many,
  });

  factory MeasureUnitModel.fromRemoteMeasureUnitDto(RemoteMeasureUnitDto dto) {
    return MeasureUnitModel._(
      id: dto.id,
      one: dto.one,
      few: dto.few,
      many: dto.many,
    );
  }

  factory MeasureUnitModel.fromLocalMeasureUnitDto(LocalMeasureUnitDto dto) {
    return MeasureUnitModel._(
      id: dto.id,
      one: dto.one,
      few: dto.few,
      many: dto.many,
    );
  }
}
