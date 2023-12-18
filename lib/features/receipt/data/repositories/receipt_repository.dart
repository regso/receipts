import 'package:receipts/config/dio.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/features/receipt/data/data_sources/local_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/measure_unit_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

class ReceiptRepository {
  RemoteReceiptDataSource remoteReceiptDataSource = RemoteReceiptDataSource(
    dio: dio,
  );
  LocalReceiptDataSource localReceiptDataSource = LocalReceiptDataSource(
    receiptsBox: receiptsBox,
    receiptIngredientsBox: receiptIngredientBox,
    ingredientsBox: ingredientsBox,
    measureUnitsBox: measureUnitBox,
  );

  Future<List<ReceiptEntity>> findReceipts() async {
    late List<ReceiptModel> receipts;
    try {
      receipts = await remoteReceiptDataSource.findReceipts();
      await localReceiptDataSource.saveReceipts(receipts);
    } on Exception {
      receipts = await localReceiptDataSource.findReceipts();
    }
    return receipts;
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

  /* Future<List<ReceiptIngredientModel>> findReceiptIngredientsByReceiptId(
    ReceiptModel receipt,
  ) async {
    late List<ReceiptIngredientModel> receiptIngredients;
    try {
      final remoteReceiptIngredientDtoList =
          await remoteReceiptDataSource.findReceiptIngredients();
      await localReceiptDataSource.saveReceiptIngredients(
        remoteReceiptIngredientDtoList,
      );
      receiptIngredients = remoteReceiptIngredientDtoList
          .map((dto) => ReceiptIngredientModel(
                id: dto.id,
                count: dto.count,
                ingredient: dto.ingredientIdDto.id,
                receipt: dto.receiptIdDto.id,
              ))
          .toList();
    } on Exception {
      receiptIngredients =
          (await localReceiptDataSource.findReceiptIngredients())
              .map((dto) => ReceiptIngredientModel(
                    id: dto.id,
                    count: dto.count,
                    ingredient: dto.ingredientId,
                    receipt: dto.receiptId,
                  ))
              .toList();
    }

    final ingredientDtoList = await remoteReceiptDataSource.findIngredients();
    final ingredientDtoMap = {for (final dto in ingredientDtoList) dto.id: dto};
    final measureUnitDtoList = await remoteReceiptDataSource.findMeasureUnits();
    final measureUnitDtoMap = {
      for (final dto in measureUnitDtoList) dto.id: dto
    };
    return remoteReceiptIngredientDtoList.map((dto) {
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

    /* late List<ReceiptIngredientModel> receiptIngredients;
    try {
      receiptIngredients = await remoteReceiptDataSource.findR();
      await localReceiptDataSource.saveIngredients(ingredients);
    } on Exception {
      ingredients = await localReceiptDataSource.findIngredients();
    }
    return ingredients.where((model) => model.amount > 0).toList();*/
  }*/

  /* Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    late List<IngredientModel> ingredients;
    try {
      ingredients = await remoteReceiptDataSource.findIngredients();
      await localReceiptDataSource.saveIngredients(ingredients);
    } on Exception {
      ingredients = await localReceiptDataSource.findIngredients();
    }
    return ingredients.where((model) => model.amount > 0).toList();
  }*/

  Future<List<CookingStepModel>> findCookingStepsByReceiptId(
    int receiptId,
  ) async {
    return await remoteReceiptDataSource.findCookingStepsByReceiptId(receiptId);
  }

  Future<List<CommentModel>> findCommentsByReceiptId(int receiptId) async {
    return await remoteReceiptDataSource.findCommentsByReceiptId(receiptId);
  }

  Future<void> saveComment(CommentModel comment) async {
    return await remoteReceiptDataSource.saveComment(comment);
  }
}
