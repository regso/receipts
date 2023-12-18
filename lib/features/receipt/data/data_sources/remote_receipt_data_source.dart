import 'dart:math';

import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';

class RemoteReceiptDataSource {
  final Dio dio;

  RemoteReceiptDataSource({required this.dio});

  Future<List<RemoteReceiptDto>> findReceipts() async {
    final response = await dio.get(Constants.apiGetReceiptUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteReceiptDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteReceiptIngredientDto>> findReceiptIngredients() async {
    final response = await dio.get(Constants.apiGetReceiptIngredientUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteReceiptIngredientDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteIngredientDto>> findIngredients() async {
    final response = await dio.get(Constants.apiGetIngredientUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteIngredientDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteMeasureUnitDto>> findMeasureUnits() async {
    final response = await dio.get(Constants.apiGetMeasureUnitUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteMeasureUnitDto.fromJson(data))
        .toList();
  }

  Future<List<CookingStepModel>> findCookingStepsByReceiptId(
    int receiptId,
  ) async {
    final cookingStepLinkDtoList = await _findCookingStepLinkDtoListByReceiptId(
      receiptId,
    );
    final cookingStepDtoMap = await _getCookingStepDtoMap();

    return cookingStepLinkDtoList
        .map(
          (dto) => CookingStepModel.fromRemoteCookingStepDtoAndNumber(
            cookingStepDtoMap[dto.cookingStepIdDto.id]!,
            dto.number,
          ),
        )
        .toList();
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
