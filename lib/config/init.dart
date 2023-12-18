import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/local_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/models/cooking_step_model.dart';

late Box<LocalReceiptDto> receiptsBox;
late Box<LocalIngredientDto> ingredientsBox;
late Box<LocalMeasureUnitDto> measureUnitBox;
late Box<LocalReceiptIngredientDto> receiptIngredientBox;
late Box<CookingStepModel> cookingStepsBox;
late Box<CommentModel> commentsBox;

Future<void> initApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalReceiptDtoAdapter());
  Hive.registerAdapter(LocalIngredientDtoAdapter());
  Hive.registerAdapter(LocalMeasureUnitDtoAdapter());
  Hive.registerAdapter(LocalReceiptIngredientDtoAdapter());
  Hive.registerAdapter(CookingStepModelAdapter());
  Hive.registerAdapter(CommentModelAdapter());
  receiptsBox = await Hive.openBox(Constants.hiveReceiptsBoxName);
  ingredientsBox = await Hive.openBox(Constants.hiveIngredientsBoxName);
  measureUnitBox = await Hive.openBox(Constants.hiveMeasureUnitBoxName);
  receiptIngredientBox = await Hive.openBox(
    Constants.hiveReceiptIngredientBoxName,
  );
  cookingStepsBox = await Hive.openBox(Constants.hiveCookingStepsBoxName);
  commentsBox = await Hive.openBox(Constants.hiveCommentsBoxName);
}
