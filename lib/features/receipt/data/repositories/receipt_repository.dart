import 'package:receipts/config/dio.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/features/receipt/data/data_sources/local_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/ingredient_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptRepository {
  RemoteReceiptDataSource remoteReceiptDataSource = RemoteReceiptDataSource(
    dio: dio,
  );
  LocalReceiptDataSource localReceiptDataSource = LocalReceiptDataSource(
    receiptsBox: receiptsBox,
  );

  Future<List<ReceiptEntity>> findReceipts() async {
    late List<ReceiptModel> receipts;
    try {
      receipts = await remoteReceiptDataSource.findReceipts();
      await localReceiptDataSource.saveReceipts(receipts);
    } on Exception {
      receipts = await localReceiptDataSource.findReceipts();
    }

    return receipts;
  }

  Future<List<IngredientModel>> findIngredientsByReceiptId(
    int receiptId,
  ) async {
    return await remoteReceiptDataSource.findIngredientsByReceiptId(receiptId);
  }

  Future<List<CookingStepModel>> findCookingStepsByReceiptId(
    int receiptId,
  ) async {
    return await remoteReceiptDataSource.findCookingStepsByReceiptId(receiptId);
  }

  Future<List<CommentModel>> findCommentsByReceiptId(int receiptId) async {
    return await remoteReceiptDataSource.findCommentsByReceiptId(receiptId);
  }

  Future<void> saveComment(CommentModel comment) async {
    return await remoteReceiptDataSource.saveComment(comment);
  }
}
