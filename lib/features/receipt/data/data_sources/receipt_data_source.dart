import 'package:dio/dio.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptRemoteDataSource {
  final Dio dio;

  ReceiptRemoteDataSource({required this.dio});

  Future<List<ReceiptModel>> getList() async {
    final Response response = await dio.get(Constants.apiGetReceiptUrl);
    final List<dynamic> receiptsDecodedJson =
        response.data as List<dynamic>;
    return receiptsDecodedJson
        .map(
          (data) => ReceiptModel(
            title: data['name'],
            imageLocation: data['photo'],
            cookingTimeMinutes: data['duration'],
            receiptIngredientModelList: [],
            cookingStepModelList: [],
            commentModelList: [],
          ),
        )
        .toList();
  }
}
