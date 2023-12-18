import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';

class MeasureUnitModel {
  final int id;
  final String one;
  final String few;
  final String many;

  MeasureUnitModel._({
    required this.id,
    required this.one,
    required this.few,
    required this.many,
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
