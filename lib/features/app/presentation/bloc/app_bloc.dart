import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/dio.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_event.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/auth/domain/usecases/authenticate_use_case.dart';
import 'package:receipts/features/receipt/data/data_sources/local_receipt_data_source.dart';
import 'package:receipts/features/receipt/data/data_sources/remote_receipt_data_source.dart';
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
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';
import 'package:receipts/features/receipt/domain/usecases/delete_favorite_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_comments_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_cooking_step_links_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_ingredients_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipts_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_comment_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_favorite_use_case.dart';
import 'package:receipts/main.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const InitializingAppState()) {
    on<LoadAppEvent>(_load);
    on<AuthorizeAppEvent>(_authorize);
  }

  void _load(
    LoadAppEvent event,
    Emitter<AppState> emit,
  ) async {
    await _init();
    emit(const UnAuthorizedUserAppState());
  }

  void _authorize(AuthorizeAppEvent event, Emitter<AppState> emit) async {
    await _initByUserId(userId: event.userId);
    if (event.userId != null && event.token != null) {
      emit(AuthorizedUserAppState(
        defaultPageSlug: AppPageSlug.receipts,
        userId: event.userId!,
        token: event.token!,
      ));
    } else {
      emit(const UnAuthorizedUserAppState());
    }
  }

  Future<void> _init() async {
    // Hive.
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

    final Box<LocalReceiptDto> receiptsBox =
        await Hive.openBox(Constants.hiveReceiptsBoxName);
    final Box<LocalReceiptIngredientDto> receiptIngredientsBox =
        await Hive.openBox(Constants.hiveReceiptIngredientsBoxName);
    final Box<LocalIngredientDto> ingredientsBox =
        await Hive.openBox(Constants.hiveIngredientsBoxName);
    final Box<LocalMeasureUnitDto> measureUnitsBox =
        await Hive.openBox(Constants.hiveMeasureUnitsBoxName);
    final Box<LocalCookingStepDto> cookingStepsBox =
        await Hive.openBox(Constants.hiveCookingStepsBoxName);
    final Box<LocalCookingStepLinkDto> cookingStepLinksBox =
        await Hive.openBox(Constants.hiveCookingStepLinksBoxName);
    final Box<LocalCommentDto> commentsBox =
        await Hive.openBox(Constants.hiveCommentsBoxName);
    final Box<LocalUserDto> usersBox =
        await Hive.openBox(Constants.hiveUsersBoxName);
    final Box<LocalCommentPhotoDto> commentPhotosBox =
        await Hive.openBox(Constants.hiveCommentPhotosBoxName);
    final Box<LocalFavoriteDto> favoritesBox =
        await Hive.openBox(Constants.hiveFavoritesBoxName);

    // Data Sources.
    sl.registerLazySingleton(
      () => RemoteReceiptDataSource(
        dio: dio,
      ),
    );
    sl.registerLazySingleton(
      () => LocalReceiptDataSource(
        receiptsBox: receiptsBox,
        receiptIngredientsBox: receiptIngredientsBox,
        ingredientsBox: ingredientsBox,
        measureUnitsBox: measureUnitsBox,
        cookingStepsBox: cookingStepsBox,
        cookingStepLinksBox: cookingStepLinksBox,
        commentsBox: commentsBox,
        usersBox: usersBox,
        commentPhotosBox: commentPhotosBox,
        favoritesBox: favoritesBox,
      ),
    );

    // Repositories.
    sl.registerLazySingleton<AbstractReceiptRepository>(
      () => ReceiptRepository(
        userId: null,
        remoteReceiptDataSource: sl(),
        localReceiptDataSource: sl(),
      ),
    );

    // Use Cases.
    sl.registerLazySingleton(
      () => AuthenticateUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => DeleteFavoriteUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FindCommentsUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FindCookingStepLinksUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FindReceiptIngredientsUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FindReceiptUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => FindReceiptsUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => GetFavoritesMapUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => SaveCommentUseCase(receiptRepository: sl()),
    );
    sl.registerLazySingleton(
      () => SaveFavoriteUseCase(receiptRepository: sl()),
    );
  }

  Future<void> _initByUserId({int? userId}) async {
    await sl.unregister(instance: sl<AbstractReceiptRepository>());
    sl.registerLazySingleton<AbstractReceiptRepository>(
      () => ReceiptRepository(
        userId: userId,
        remoteReceiptDataSource: sl(),
        localReceiptDataSource: sl(),
      ),
    );
  }
}
