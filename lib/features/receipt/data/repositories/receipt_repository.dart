import 'package:intl/intl.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/dio.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/features/receipt/data/data_sources/local_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_user_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_link_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/measure_unit_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/data/models/user_model.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/user_entity.dart';

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
    commentsBox: commentsBox,
    usersBox: usersBox,
  );

  Future<List<ReceiptEntity>> findReceipts() => _findRemoteReceipt().catchError(
        (_) => _findLocalReceipt(),
      );

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
  ) =>
      _findRemoteReceiptIngredientsByReceipt(receipt).catchError(
        (_) => _findLocalReceiptIngredientsByReceipt(receipt),
      );

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

  Future<List<ReceiptIngredientModel>> _findLocalReceiptIngredientsByReceipt(
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
  ) =>
      _findRemoteCookingStepLinksByReceipt(receipt).catchError(
        (_) => _findLocalCookingStepLinksByReceipt(receipt),
      );

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
        number: dto.number,
        receipt: receipt,
        cookingStep: cookingStep,
      );
    }).toList();
  }

  Future<List<CookingStepLinkModel>> _findLocalCookingStepLinksByReceipt(
    ReceiptEntity receipt,
  ) async {
    final cookingSteps = await localReceiptDataSource.findCookingSteps();
    final cookingStepsMap = {for (final dto in cookingSteps) dto.id: dto};
    return (await localReceiptDataSource.findCookingStepLinks())
        .where((dto) => dto.receiptId == receipt.id)
        .map((dto) {
      return CookingStepLinkModel(
        id: dto.id,
        number: dto.number,
        receipt: receipt,
        cookingStep: CookingStepModel.fromLocalCookingStepDto(
          cookingStepsMap[dto.cookingStepId]!,
        ),
      );
    }).toList();
  }

  Future<void> saveCommentByReceipt(String text, ReceiptEntity receipt) async {
    final user = await _getUserById(
      Constants.appUserId,
    );
    final comment = CommentModel(
      id: 0,
      text: text,
      photo: '',
      createdAt:  DateFormat("yyyy-MM-ddTHH:mm:ss.S'Z'")
          .format(DateTime.now().toUtc()),
      user: user,
      receipt: receipt,
    );
    return remoteReceiptDataSource.saveComment(comment);
  }

  Future<List<CommentEntity>> findCommentsByReceipt(
    ReceiptEntity receipt,
  ) =>
      _findRemoteCommentsByReceipt(receipt).catchError(
        (_) => _findLocalCommentsByReceipt(receipt),
      );

  Future<List<CommentModel>> _findRemoteCommentsByReceipt(
    ReceiptEntity receipt,
  ) async {
    final remoteCommentDtoList = await remoteReceiptDataSource.findComments();
    await localReceiptDataSource.saveRemoteComments(remoteCommentDtoList);
    final remoteUsersDtoMap = await _getRemoteUsersDtoMapByCommentDtoList(
      remoteCommentDtoList,
    );
    final remoteUserDtoList =
        remoteUsersDtoMap.entries.map((entry) => entry.value).toList();
    await localReceiptDataSource.saveRemoteUsers(remoteUserDtoList);
    return remoteCommentDtoList
        .where((dto) => dto.receiptIdDto.id == receipt.id)
        .map((dto) {
      return CommentModel(
        id: dto.id,
        text: dto.text,
        photo: '',
        createdAt: dto.datetime,
        user: UserModel.fromRemoteUserDto(
          remoteUsersDtoMap[dto.userIdDto.id]!,
        ),
        receipt: receipt,
      );
    }).toList();
  }

  Future<Map<int, RemoteUserDto>> _getRemoteUsersDtoMapByCommentDtoList(
    List<RemoteCommentDto> remoteCommentDtoList,
  ) async {
    Map<int, RemoteUserDto> remoteUsersDtoMap = {};
    for (final dto in remoteCommentDtoList) {
      if (!remoteUsersDtoMap.containsKey(dto.userIdDto.id)) {
        final remoteUserDto = await remoteReceiptDataSource.getUserById(
          dto.userIdDto.id,
        );
        remoteUsersDtoMap[dto.userIdDto.id] = remoteUserDto;
      }
    }
    return remoteUsersDtoMap;
  }

  Future<List<CommentModel>> _findLocalCommentsByReceipt(
    ReceiptEntity receipt,
  ) async {
    final localUserDtoList = await localReceiptDataSource.findUsers();
    final localUsersDtoMap = {for (final dto in localUserDtoList) dto.id: dto};
    final localCommentDtoList = await localReceiptDataSource.findComments();
    return localCommentDtoList
        .where((final dto) => dto.receiptId == receipt.id)
        .map((dto) => CommentModel(
              id: dto.id,
              text: dto.text,
              photo: '',
              createdAt: dto.createdAt,
              user: UserModel.fromLocalReceiptDto(
                localUsersDtoMap[dto.userId]!,
              ),
              receipt: receipt,
            ))
        .toList();
  }

  Future<UserEntity> _getUserById(int id) async => UserModel.fromRemoteUserDto(
        await remoteReceiptDataSource.getUserById(id),
      );
}
