import 'dart:math';

import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/localization.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class RemoteReceiptDataSource {
  final Dio dio;

  RemoteReceiptDataSource({required this.dio});

  Future<List<ReceiptModel>> findReceipts() async {
    final response = await dio.get(Constants.apiGetReceiptUrl);
    final receiptsDecodedJson = response.data as List<dynamic>;

    return receiptsDecodedJson
        .map(
          (data) => ReceiptModel.fromRemoteReceiptDto(
            RemoteReceiptDto.fromJson(data),
          ),
        )
        .toList();
  }

  Future<List<CookingStepModel>> findCookingStepsByReceiptId(
    int receiptId,
  ) async {
    final cookingStepLinkDtoList = await _findCookingStepLinkDtoListByReceiptId(
      receiptId,
    );
    final cookingStepDtoMap = await _getCookingStepDtoMap();

    return cookingStepLinkDtoList.map((dto) {
      return CookingStepModel.fromRemoteCookingStepDtoAndNumber(
        cookingStepDtoMap[dto.cookingStepIdDto.id]!,
        dto.number,
      );
    }).toList();
  }

  Future<List<RemoteCookingStepLinkDto>> _findCookingStepLinkDtoListByReceiptId(
    int receiptId,
  ) async {
    final response = await dio.get(Constants.apiGetCookingStepLinkUrl);
    final stepLinksDecodedJson = response.data as List<dynamic>;
    return stepLinksDecodedJson
        .map((data) => RemoteCookingStepLinkDto.fromJson(data))
        .where((dto) => dto.receiptIdDto.id == receiptId)
        .toList();
  }

  Future<Map<int, RemoteCookingStepDto>> _getCookingStepDtoMap() async {
    final response = await dio.get(Constants.apiGetCookingStepUrl);
    final unitsDecodedJson = response.data as List<dynamic>;
    final Iterable<RemoteCookingStepDto> stepsDto = unitsDecodedJson.map(
      (data) => RemoteCookingStepDto.fromJson(data),
    );
    return {for (RemoteCookingStepDto dto in stepsDto) dto.id: dto};
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    final receiptIngredientDtoList =
        await _findReceiptIngredientDtoListByReceiptId(
      receiptId,
    );
    final ingredientDtoMap = await _getRemoteIngredientDtoMap();
    final measureUnitDtoMap = await _getMeasureUnitDtoMap();

    return receiptIngredientDtoList.map(
      (RemoteReceiptIngredientDto dto) {
        final ingredientDto = ingredientDtoMap[dto.ingredientIdDto.id]!;
        final measureUnitDto =
            measureUnitDtoMap[ingredientDto.measureUnitIdModel.id]!;
        return IngredientModel(
          id: ingredientDto.id,
          title: ingredientDto.name,
          amount: dto.count,
          measure: Localization.getMorph(
            dto.count,
            [measureUnitDto.one, measureUnitDto.few, measureUnitDto.many],
          ),
        );
      },
    ).toList();
  }

  Future<Map<int, RemoteIngredientDto>> _getRemoteIngredientDtoMap() async {
    final response = await dio.get(Constants.apiGetIngredientUrl);
    final decodedJsonList = response.data as List<dynamic>;
    final ingredientDtoItr =
        decodedJsonList.map((data) => RemoteIngredientDto.fromJson(data));
    return {for (RemoteIngredientDto dto in ingredientDtoItr) dto.id: dto};
  }

  Future<Map<int, RemoteMeasureUnitDto>> _getMeasureUnitDtoMap() async {
    final response = await dio.get(Constants.apiGetMeasureUnitUrl);
    final unitsDecodedJson = response.data as List<dynamic>;
    final Iterable<RemoteMeasureUnitDto> unitsDto =
        unitsDecodedJson.map((data) {
      return RemoteMeasureUnitDto.fromJson(data);
    });
    return {for (RemoteMeasureUnitDto dto in unitsDto) dto.id: dto};
  }

  Future<List<RemoteReceiptIngredientDto>>
      _findReceiptIngredientDtoListByReceiptId(
    int receiptId,
  ) async {
    final response = await dio.get(Constants.apiGetReceiptIngredientUrl);
    final receiptIngredientDecodedJson = response.data as List<dynamic>;
    return receiptIngredientDecodedJson
        .map((data) => RemoteReceiptIngredientDto.fromJson(data))
        .where((dto) => dto.receiptIdDto.id == receiptId)
        .toList();
  }

  Future<List<CommentModel>> findCommentsByReceiptId(int receiptId) async {
    return (await _findComments())
        .where((CommentModel model) => model.receiptId == receiptId)
        .toList();
  }

  Future<List<CommentModel>> _findComments() async {
    final response = await dio.get(Constants.apiGetCommentUrl);
    final commentDecodedJson = response.data as List<dynamic>;
    return commentDecodedJson
        .map(
          (data) => CommentModel.fromRemoteCommentDto(
            RemoteCommentDto.fromJson(data),
          ),
        )
        .toList();
  }

  Future<void> saveComment(CommentModel comment) async {
    final commentDto = RemoteCommentDto.fromModel(comment);
    final jsonData = commentDto.toJson();
    if (jsonData['id'] == 0) {
      jsonData['id'] = await _getCommentNextId();
    }
    await dio.post(Constants.apiPostCommentUrl, data: jsonData);
  }

  Future<int> _getCommentNextId() async {
    final comments = await _findComments();
    return comments.fold<int>(1, (prev, model) => max(prev, model.id)) + 1;
  }
}
