import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class LocalReceiptDataSource {
  final Box<ReceiptModel> receiptsBox;

  LocalReceiptDataSource({required this.receiptsBox});

  Future<List<ReceiptModel>> findReceipts() async {
    return receiptsBox.values.toList();
  }
}
