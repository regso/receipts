import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptRemoteDataSource {
  final Dio dio;

  ReceiptRemoteDataSource({required this.dio});

  Future<List<ReceiptModel>> findReceipts() async {
    final Response response = await dio.get(Constants.apiGetReceiptUrl);
    final List<dynamic> receiptsDecodedJson = response.data as List<dynamic>;

    return receiptsDecodedJson
        .map(
          (data) => ReceiptModel.fromRemoteReceiptDto(
            RemoteReceiptDto.fromJson(data),
          ),
        )
        .toList();
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    final List<int> ingredientsIds = await _findIngredientIdsByReceiptId(
      receiptId,
    );

    final Response response = await dio.get(Constants.apiGetIngredientUrl);
    final List<dynamic> ingredientsDecodedJson = response.data as List<dynamic>;
    return ingredientsDecodedJson
        .map((data) {
          return IngredientModel.fromJson(data);
        })
        .where((model) => ingredientsIds.contains(model.id))
        .toList();
  }

  Future<List<int>> _findIngredientIdsByReceiptId(
    int receiptId,
  ) async {
    final Response response = await dio.get(
      Constants.apiGetReceiptIngredientUrl,
    );
    final List<dynamic> receiptIngredientDecodedJson =
        response.data as List<dynamic>;
    final receiptIngredientModelList = receiptIngredientDecodedJson
        .map((data) {
          return ReceiptIngredientModel.fromJson(data);
        })
        .where((model) => model.receiptIdModel.id == receiptId)
        .toList();
    return receiptIngredientModelList
        .map((model) => model.ingredientIdModel.id)
        .toList();
  }
}
