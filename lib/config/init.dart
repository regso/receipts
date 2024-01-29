import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/dto/local_comment_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_comment_photo_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_cooking_step_link_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_favorite_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_measure_unit_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_receipt_ingredient_dto.dart';
import 'package:receipts/features/receipt/data/dto/local_user_dto.dart';

late Box<LocalReceiptDto> receiptsBox;
late Box<LocalIngredientDto> ingredientsBox;
late Box<LocalMeasureUnitDto> measureUnitsBox;
late Box<LocalReceiptIngredientDto> receiptIngredientsBox;
late Box<LocalCookingStepDto> cookingStepsBox;
late Box<LocalCookingStepLinkDto> cookingStepLinksBox;
late Box<LocalCommentDto> commentsBox;
late Box<LocalUserDto> usersBox;
late Box<LocalCommentPhotoDto> commentPhotosBox;
late Box<LocalFavoriteDto> favoritesBox;

Future<void> initApp() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalReceiptDtoAdapter());
  Hive.registerAdapter(LocalIngredientDtoAdapter());
  Hive.registerAdapter(LocalMeasureUnitDtoAdapter());
  Hive.registerAdapter(LocalReceiptIngredientDtoAdapter());
  Hive.registerAdapter(LocalCookingStepDtoAdapter());
  Hive.registerAdapter(LocalCookingStepLinkDtoAdapter());
  Hive.registerAdapter(LocalCommentDtoAdapter());
  Hive.registerAdapter(LocalUserDtoAdapter());
  Hive.registerAdapter(LocalCommentPhotoDtoAdapter());
  Hive.registerAdapter(LocalFavoriteDtoAdapter());

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
  usersBox = await Hive.openBox(Constants.hiveUsersBoxName);
  commentPhotosBox = await Hive.openBox(Constants.hiveCommentPhotosBoxName);
  favoritesBox = await Hive.openBox(Constants.hiveFavoritesBoxName);
}
