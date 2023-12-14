import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

late Box<ReceiptModel> receiptsBox;
late Box<CommentModel> commentsBox;

Future<void> initApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ReceiptModelAdapter());
  Hive.registerAdapter(CommentModelAdapter());
  receiptsBox = await Hive.openBox(Constants.hiveReceiptsBoxName);
  commentsBox = await Hive.openBox(Constants.hiveCommentsBoxName);
}
