import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';

class LocalReceiptDataSource {
  final Box<LocalReceiptDto> receiptsBox;
  final Box<LocalReceiptIngredientDto> receiptIngredientsBox;
  final Box<LocalIngredientDto> ingredientsBox;
  final Box<LocalMeasureUnitDto> measureUnitsBox;
  final Box<LocalCookingStepDto> cookingStepsBox;
  final Box<LocalCookingStepLinkDto> cookingStepLinksBox;

  LocalReceiptDataSource({
    required this.receiptsBox,
    required this.receiptIngredientsBox,
    required this.ingredientsBox,
    required this.measureUnitsBox,
    required this.cookingStepsBox,
    required this.cookingStepLinksBox,
  });

  Future<List<LocalReceiptDto>> findReceipts() async {
    return receiptsBox.values.toList();
  }

  Future<void> saveRemoteReceipts(List<RemoteReceiptDto> receipts) async {
    final Map<int, LocalReceiptDto> receiptsMap = {};
    for (final dto in receipts) {
      receiptsMap[dto.id] = LocalReceiptDto(
        id: dto.id,
        title: dto.name,
        cookingTimeMinutes: dto.duration,
        photoUrl: '',
      );
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
    final Map<int, LocalIngredientDto> localIngredientsMap = {};
    for (final dto in ingredients) {
      localIngredientsMap[dto.id] = LocalIngredientDto(
        id: dto.id,
        title: dto.name,
        measureUnitId: dto.measureUnitIdModel.id,
      );
    }
    await ingredientsBox.clear();
    await ingredientsBox.putAll(localIngredientsMap);
  }

  Future<List<LocalMeasureUnitDto>> findMeasureUnits() async {
    return measureUnitsBox.values.toList();
  }

  Future<void> saveRemoteMeasureUnits(
    List<RemoteMeasureUnitDto> measureUnits,
  ) async {
    final Map<int, LocalMeasureUnitDto> localMeasureUnitsMap = {};
    for (final dto in measureUnits) {
      localMeasureUnitsMap[dto.id] = LocalMeasureUnitDto(
        id: dto.id,
        one: dto.one,
        few: dto.few,
        many: dto.many,
      );
    }
    await measureUnitsBox.clear();
    await measureUnitsBox.putAll(localMeasureUnitsMap);
  }

  Future<List<LocalCookingStepDto>> findCookingSteps() async {
    return cookingStepsBox.values.toList();
  }

  Future<void> saveRemoteCookingSteps(
    List<RemoteCookingStepDto> cookingSteps,
  ) async {
    final Map<int, LocalCookingStepDto> localCookingStepsMap = {};
    for (final dto in cookingSteps) {
      localCookingStepsMap[dto.id] = LocalCookingStepDto(
        id: dto.id,
        title: dto.name,
        cookingTimeMinutes: dto.duration,
      );
    }
    await cookingStepsBox.clear();
    await cookingStepsBox.putAll(localCookingStepsMap);
  }

  Future<List<LocalCookingStepLinkDto>> findCookingStepLinks() async {
    return cookingStepLinksBox.values.toList();
  }

  Future<void> saveRemoteCookingStepLinks(
    List<RemoteCookingStepLinkDto> cookingStepLinks,
  ) async {
    final Map<int, LocalCookingStepLinkDto> localCookingStepLinksMap = {};
    for (final dto in cookingStepLinks) {
      localCookingStepLinksMap[dto.id] = LocalCookingStepLinkDto(
        id: dto.id,
        number: dto.number,
        receiptId: dto.receiptIdDto.id,
        cookingStepId: dto.cookingStepIdDto.id,
      );
    }
    await cookingStepLinksBox.clear();
    await cookingStepLinksBox.putAll(localCookingStepLinksMap);
  }
}
