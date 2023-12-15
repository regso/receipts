import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class LocalReceiptDataSource {
  final Box<LocalReceiptDto> receiptsBox;

  LocalReceiptDataSource({required this.receiptsBox});

  Future<List<ReceiptModel>> findReceipts() async {
    final localReceiptDtoList = receiptsBox.values.toList();
    return localReceiptDtoList
        .map((dto) => ReceiptModel.fromLocalReceiptDto(dto))
        .toList();
  }

  Future<void> saveReceipts(List<ReceiptModel> receipts) async {
    final Map<int, LocalReceiptDto> receiptsMap = {};
    for (ReceiptModel model in receipts) {
      receiptsMap[model.id] = LocalReceiptDto.fromModel(model);
    }
    await receiptsBox.clear();
    await receiptsBox.putAll(receiptsMap);
  }
}
