import 'dart:math' hide log;

import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/remote_comment_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_favorite_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/remote_user_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';

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

  Future<List<RemoteCookingStepDto>> findCookingSteps() async {
    final response = await dio.get(Constants.apiGetCookingStepUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteCookingStepDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteCookingStepLinkDto>> findCookingStepLinkDtoList() async {
    final response = await dio.get(Constants.apiGetCookingStepLinkUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteCookingStepLinkDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteCommentDto>> findComments() async {
    final response = await dio.get(Constants.apiGetCommentUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteCommentDto.fromJson(data))
        .toList();
  }

  Future<List<RemoteFavoriteDto>> findFavorites() async {
    final response = await dio.get(Constants.apiGetFavoriteUrl);
    final decodedJsonList = response.data as List<dynamic>;
    return decodedJsonList
        .map((data) => RemoteFavoriteDto.fromJson(data))
        .toList();
  }

  Future<void> saveFavorite(int receiptId) async {
    final favoriteDto = RemoteFavoriteDto(
      id: 0,
      receiptIdDto: RemoteReceiptIdDto(id: receiptId),
      userIdDto: RemoteUserIdDto(id: Constants.appUserId),
    );
    final jsonData = favoriteDto.toJson()..remove('id');
    await dio.post(Constants.apiGetFavoriteUrl, data: jsonData);
  }

  Future<void> deleteFavorite(int favoriteId) async {
    await dio.delete('${Constants.apiGetFavoriteUrl}/$favoriteId');
  }

  Future<int> saveComment(CommentModel comment) async {
    final commentDto = RemoteCommentDto.fromModel(comment);
    final jsonData = commentDto.toJson();
    if (jsonData['id'] == 0) {
      jsonData['id'] = await _getCommentNextId();
    }
    await dio.post(Constants.apiPostCommentUrl, data: jsonData);
    return jsonData['id'] as int;
  }

  Future<int> _getCommentNextId() async {
    final comments = await findComments();
    return comments.fold<int>(1, (prev, model) => max(prev, model.id)) + 1;
  }

  Future<RemoteUserDto> getUserById(int id) async {
    final response = await dio.get('${Constants.apiGetUserUrl}$id');
    final decodedJson = response.data as Map<String, dynamic>;
    return RemoteUserDto.fromJson(decodedJson);
  }
}
