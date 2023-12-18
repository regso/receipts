import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';

late Box<LocalReceiptDto> receiptsBox;
late Box<LocalIngredientDto> ingredientsBox;
late Box<LocalMeasureUnitDto> measureUnitsBox;
late Box<LocalReceiptIngredientDto> receiptIngredientsBox;
late Box<LocalCookingStepDto> cookingStepsBox;
late Box<LocalCookingStepLinkDto> cookingStepLinksBox;
late Box<CommentModel> commentsBox;

Future<void> initApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalReceiptDtoAdapter());
  Hive.registerAdapter(LocalIngredientDtoAdapter());
  Hive.registerAdapter(LocalMeasureUnitDtoAdapter());
  Hive.registerAdapter(LocalReceiptIngredientDtoAdapter());
  Hive.registerAdapter(LocalCookingStepDtoAdapter());
  Hive.registerAdapter(LocalCookingStepLinkDtoAdapter());
  Hive.registerAdapter(CommentModelAdapter());
  receiptsBox = await Hive.openBox(Constants.hiveReceiptsBoxName);
  ingredientsBox = await Hive.openBox(Constants.hiveIngredientsBoxName);
  measureUnitsBox = await Hive.openBox(Constants.hiveMeasureUnitsBoxName);
  receiptIngredientsBox = await Hive.openBox(
    Constants.hiveReceiptIngredientsBoxName,
  );
  cookingStepsBox = await Hive.openBox(Constants.hiveCookingStepsBoxName);
  cookingStepLinksBox = await Hive.openBox(
    Constants.hiveCookingStepLinksBoxName,
  );
  commentsBox = await Hive.openBox(Constants.hiveCommentsBoxName);
}
