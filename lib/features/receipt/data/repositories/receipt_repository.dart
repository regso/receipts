import 'package:receipts/config/dio.dart';
import 'package:receipts/features/receipt/data/data_sources/receipt_data_source.dart';
import 'package:receipts/features/receipt/data/dto/ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/receipt_model.dart';

class ReceiptRepository {
  ReceiptRemoteDataSource receiptRemoteDataSource =
      ReceiptRemoteDataSource(dio: dio);

  Future<List<ReceiptModel>> findReceipts() async {
    return await receiptRemoteDataSource.findReceipts();
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    return receiptRemoteDataSource.findIngredientsByReceiptId(receiptId);
  }
}
