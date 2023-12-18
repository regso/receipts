import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/features/receipt/data/dto/local_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class LocalReceiptDataSource {
  final Box<LocalReceiptDto> receiptsBox;
  final Box<LocalReceiptIngredientDto> receiptIngredientsBox;
  final Box<LocalIngredientDto> ingredientsBox;
  final Box<LocalMeasureUnitDto> measureUnitsBox;

  LocalReceiptDataSource({
    required this.receiptsBox,
    required this.receiptIngredientsBox,
    required this.ingredientsBox,
    required this.measureUnitsBox,
  });

  Future<List<ReceiptModel>> findReceipts() async {
    final localReceiptDtoList = receiptsBox.values.toList();
    return localReceiptDtoList
        .map((dto) => ReceiptModel.fromLocalReceiptDto(dto))
        .toList();
  }

  Future<void> saveReceipts(List<ReceiptModel> receipts) async {
    final Map<int, LocalReceiptDto> receiptsMap = {};
    for (ReceiptModel model in receipts) {
      receiptsMap[model.id] = LocalReceiptDto.fromModelAndPhotoUrl(model, '');
    }
    await receiptsBox.clear();
    await receiptsBox.putAll(receiptsMap);
  }

  Future<List<LocalReceiptIngredientDto>> findReceiptIngredients() async {
    return receiptIngredientsBox.values.toList();
  }

  Future<void> saveRemoteReceiptIngredients(
    List<RemoteReceiptIngredientDto> remoteReceiptIngredientDtoList,
  ) async {
    final Map<int, LocalReceiptIngredientDto> localReceiptIngredientsMap = {};
    for (final remoteDto in remoteReceiptIngredientDtoList) {
      localReceiptIngredientsMap[remoteDto.id] = LocalReceiptIngredientDto(
        id: remoteDto.id,
        count: remoteDto.count,
        ingredientId: remoteDto.ingredientIdDto.id,
        receiptId: remoteDto.receiptIdDto.id,
      );
    }
    await receiptIngredientsBox.clear();
    await receiptIngredientsBox.putAll(localReceiptIngredientsMap);
  }

  Future<List<LocalIngredientDto>> findIngredients() async {
    return ingredientsBox.values.toList();
  }

  Future<void> saveRemoteIngredients(
    List<RemoteIngredientDto> ingredients,
  ) async {
    /* final Map<int, LocalIngredientDto> ingredientsMap = {
      for (IngredientModel model in ingredients)
        model.id: LocalIngredientDto.fromModel(model)
    };
    await ingredientsBox.clear();
    await ingredientsBox.putAll(ingredientsMap);*/
  }

  /* Future<Map<int, MeasureUnitModel>> getMeasureUnitsMap() async {
    final measureUnits = await findMeasureUnits();
    return {for (MeasureUnitModel model in measureUnits) model.id: model};
  }*/

  Future<List<LocalMeasureUnitDto>> findMeasureUnits() async {
    return measureUnitsBox.values.toList();
  }

  Future<void> saveRemoteMeasureUnits(
    List<RemoteMeasureUnitDto> measureUnits,
  ) async {
    /* final Map<int, LocalMeasureUnitDto> measureUnitsMap = {
      for (MeasureUnitModel model in measureUnits)
        model.id: LocalMeasureUnitDto.fromMeasureUnitModel(model)
    };
    await measureUnitsBox.clear();
    await measureUnitsBox.putAll(measureUnitsMap);*/
  }
}
