import 'package:receipts/config/dio.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/features/receipt/data/data_sources/local_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_link_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/measure_unit_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

class ReceiptRepository {
  RemoteReceiptDataSource remoteReceiptDataSource = RemoteReceiptDataSource(
    dio: dio,
  );
  LocalReceiptDataSource localReceiptDataSource = LocalReceiptDataSource(
    receiptsBox: receiptsBox,
    receiptIngredientsBox: receiptIngredientsBox,
    ingredientsBox: ingredientsBox,
    measureUnitsBox: measureUnitsBox,
    cookingStepsBox: cookingStepsBox,
    cookingStepLinksBox: cookingStepLinksBox,
  );

  Future<List<ReceiptEntity>> findReceipts() async {
    try {
      return _findRemoteReceipt();
    } on Exception {
      return _findLocalReceipt();
    }
  }

  Future<List<ReceiptModel>> _findRemoteReceipt() async {
    final remoteReceiptDtoList = await remoteReceiptDataSource.findReceipts();
    await localReceiptDataSource.saveRemoteReceipts(remoteReceiptDtoList);
    return remoteReceiptDtoList
        .map((dto) => ReceiptModel.fromRemoteReceiptDto(dto))
        .toList();
  }

  Future<List<ReceiptModel>> _findLocalReceipt() async {
    return (await localReceiptDataSource.findReceipts())
        .map((dto) => ReceiptModel.fromLocalReceiptDto(dto))
        .toList();
  }

  Future<List<ReceiptIngredientEntity>> findReceiptIngredientsByReceipt(
    ReceiptEntity receipt,
  ) async {
    try {
      return _findRemoteReceiptIngredientsByReceipt(receipt);
    } on Exception {
      return _findLocalReceiptIngredientsByReceipt(receipt);
    }
  }

  Future<List<ReceiptIngredientModel>> _findRemoteReceiptIngredientsByReceipt(
    ReceiptEntity receipt,
  ) async {
    final remoteReceiptIngredientDtoList =
        await remoteReceiptDataSource.findReceiptIngredients();
    await localReceiptDataSource.saveRemoteReceiptIngredients(
      remoteReceiptIngredientDtoList,
    );

    final ingredientDtoList = await remoteReceiptDataSource.findIngredients();
    final ingredientDtoMap = {for (final dto in ingredientDtoList) dto.id: dto};
    await localReceiptDataSource.saveRemoteIngredients(ingredientDtoList);

    final measureUnitDtoList = await remoteReceiptDataSource.findMeasureUnits();
    final measureUnitDtoMap = {
      for (final dto in measureUnitDtoList) dto.id: dto
    };
    await localReceiptDataSource.saveRemoteMeasureUnits(measureUnitDtoList);

    return remoteReceiptIngredientDtoList
        .where((dto) => dto.receiptIdDto.id == receipt.id)
        .map((dto) {
      final ingredientDto = ingredientDtoMap[dto.ingredientIdDto.id]!;
      final measureUnit = MeasureUnitModel.fromRemoteMeasureUnitDto(
        measureUnitDtoMap[ingredientDto.measureUnitIdModel.id]!,
      );
      final ingredient = IngredientModel(
        id: ingredientDto.id,
        title: ingredientDto.name,
        measureUnit: measureUnit,
      );
      return ReceiptIngredientModel(
        id: dto.id,
        count: dto.count,
        ingredient: ingredient,
        receipt: receipt,
      );
    }).toList();
  }

  Future<List<ReceiptIngredientEntity>> _findLocalReceiptIngredientsByReceipt(
    ReceiptEntity receipt,
  ) async {
    final ingredientDtoList = await localReceiptDataSource.findIngredients();
    final ingredientDtoMap = {for (final dto in ingredientDtoList) dto.id: dto};

    final measureUnitDtoList = await localReceiptDataSource.findMeasureUnits();
    final measureUnitDtoMap = {
      for (final dto in measureUnitDtoList) dto.id: dto
    };

    return (await localReceiptDataSource.findReceiptIngredients())
        .where((dto) => dto.receiptId == receipt.id)
        .map((dto) {
      final ingredientDto = ingredientDtoMap[dto.ingredientId]!;
      final measureUnit = MeasureUnitModel.fromLocalMeasureUnitDto(
        measureUnitDtoMap[ingredientDto.measureUnitId]!,
      );
      final ingredient = IngredientModel(
        id: ingredientDto.id,
        title: ingredientDto.title,
        measureUnit: measureUnit,
      );
      return ReceiptIngredientModel(
        id: dto.id,
        count: dto.count,
        ingredient: ingredient,
        receipt: receipt,
      );
    }).toList();
  }

  Future<List<CookingStepLinkEntity>> findCookingStepLinksByReceipt(
    ReceiptEntity receipt,
  ) async {
    try {
      return await _findRemoteCookingStepLinksByReceipt(receipt);
    } on Exception {
      return await _findLocalCookingStepLinksByReceipt(receipt);
    }
  }

  Future<List<CookingStepLinkModel>> _findRemoteCookingStepLinksByReceipt(
    ReceiptEntity receipt,
  ) async {
    final remoteCookingStepDtoList =
        await remoteReceiptDataSource.findCookingSteps();
    final remoteCookingStepsMap = {
      for (final dto in remoteCookingStepDtoList) dto.id: dto
    };
    await localReceiptDataSource.saveRemoteCookingSteps(
      remoteCookingStepDtoList,
    );

    final remoteCookingStepLinkDtoList =
        await remoteReceiptDataSource.findCookingStepLinkDtoList();
    await localReceiptDataSource.saveRemoteCookingStepLinks(
      remoteCookingStepLinkDtoList,
    );

    return remoteCookingStepLinkDtoList
        .where((dto) => dto.receiptIdDto.id == receipt.id)
        .map((dto) {
      final remoteCookingStepDto =
          remoteCookingStepsMap[dto.cookingStepIdDto.id]!;
      final cookingStep = CookingStepModel.fromRemoteCookingStepDto(
        remoteCookingStepDto,
      );
      return CookingStepLinkModel(
        id: 0,
        number: 0,
        receipt: receipt,
        cookingStep: cookingStep,
      );
    }).toList();
  }

  Future<List<CookingStepLinkModel>> _findLocalCookingStepLinksByReceipt(
    ReceiptEntity receipt,
  ) async {
    (await localReceiptDataSource.findReceipts())
        .map((dto) => ReceiptModel.fromLocalReceiptDto(dto))
        .toList();
    return [];
  }

  Future<List<CommentModel>> findCommentsByReceiptId(int receiptId) async {
    return await remoteReceiptDataSource.findCommentsByReceiptId(receiptId);
  }

  Future<void> saveComment(CommentModel comment) async {
    return await remoteReceiptDataSource.saveComment(comment);
  }
}
