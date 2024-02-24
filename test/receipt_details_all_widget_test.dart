import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:receipts/features/receipt/domain/entities/ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';
import 'package:receipts/features/receipt/domain/usecases/find_comments_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_cooking_step_links_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_ingredients_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/find_receipt_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_favorite_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_event.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_widget.dart';

const receiptTitle = 'Receipt Title';
const ingredientTitle = 'Ingredient Title';

class MockReceiptRepository extends Mock implements AbstractReceiptRepository {}

void main() {
  testWidgets('Receipt details all widgets check.', (widgetTester) async {
    const receipt = ReceiptEntity(
      id: 3,
      title: receiptTitle,
      cookingTimeMinutes: 10,
      photoUrl: '',
    );

    final receiptIngredients = [
      ReceiptIngredientEntity(
        id: 5,
        count: 5,
        ingredient: IngredientEntity(
          id: 10,
          title: ingredientTitle,
          caloriesForUnit: 10,
          measureUnit: MeasureUnitEntity(id: 100, one: '', few: '', many: ''),
        ),
        receipt: receipt,
      ),
    ];

    final receiptRepository = MockReceiptRepository();
    when(() => receiptRepository.findReceipt(receipt.id))
        .thenAnswer((_) async => receipt);
    when(() => receiptRepository.findReceiptIngredientsByReceipt(receipt))
        .thenAnswer((_) async => receiptIngredients);
    when(() => receiptRepository.findCookingStepLinksByReceipt(receipt))
        .thenAnswer((_) async => []);
    when(() => receiptRepository.findCommentsByReceipt(receipt))
        .thenAnswer((_) async => []);

    when(() => receiptRepository.findFavorites()).thenAnswer((_) async => []);
    when(() => receiptRepository.saveFavorite(receipt.id))
        .thenAnswer((_) async {});

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => FindReceiptUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => GetFavoritesMapUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => SaveFavoriteUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => FindReceiptIngredientsUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => FindCookingStepLinksUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => FindCommentsUseCase(receiptRepository: receiptRepository),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider<ReceiptBloc>(
            create: (BuildContext context) {
              final bloc = ReceiptBloc();
              bloc.add(LoadReceiptEvent(receiptId: receipt.id));
              return bloc;
            },
            child: const ReceiptWidget(),
          ),
        ),
      ),
    );
    // verify(() => receiptRepository.findFavorites()).called(1);

    await widgetTester.pump();
    // await widgetTester.pumpAndSettle();
    expect(find.text(receiptTitle), findsOneWidget);
    expect(find.text(ingredientTitle), findsOneWidget);
    // await widgetTester.tap(find.byType(GestureDetector));
    // verify(() => receiptRepository.saveFavorite(receipt.id)).called(1);
  });
}
