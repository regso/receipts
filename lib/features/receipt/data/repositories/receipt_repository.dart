import 'package:receipts/config/dio.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptRepository {
  RemoteReceiptDataSource remoteReceiptDataSource =
      RemoteReceiptDataSource(dio: dio);

  Future<List<ReceiptModel>> findReceipts() async {
    return await remoteReceiptDataSource.findReceipts();
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    return remoteReceiptDataSource.findIngredientsByReceiptId(receiptId);
  }
}
