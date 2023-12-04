import 'package:receipts/config/dio.dart';
import 'package:receipts/features/receipt/data/data_sources/receipt_data_source.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptRepository {
  Future<List<ReceiptModel>> getList() async {
    ReceiptRemoteDataSource receiptRemoteDataSource =
        ReceiptRemoteDataSource(dio: dio);
    return await receiptRemoteDataSource.getList();
  }
}
