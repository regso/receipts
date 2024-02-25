import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/user_entity.dart';
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

class MockReceiptRepository extends Mock implements AbstractReceiptRepository {}

void main() {
  testWidgets('Receipt details all widgets check.', (widgetTester) async {
    const receiptTitle = 'Receipt Title';
    const ingredientTitle = 'Ingredient Title';
    const cookingStepTitle = 'Cooking Step Title';
    const commentText = 'Comment Text';

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

    final cookingStepLinks = [
      CookingStepLinkEntity(
        id: 7,
        number: 1,
        receipt: receipt,
        cookingStep: CookingStepEntity(
          id: 17,
          title: cookingStepTitle,
          cookingTimeMinutes: 20,
        ),
      )
    ];

    final comments = [
      CommentEntity(
        id: 4,
        text: commentText,
        photo: Uint8List(0),
        createdAt: DateFormat("yyyy-MM-ddTHH:mm:ss.S'Z'")
            .format(DateTime.now().toUtc()),
        user: UserEntity(
          id: 9,
          login: 'user1',
          password: 'user1',
          token: 'token',
          avatar: '',
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
        .thenAnswer((_) async => cookingStepLinks);
    when(() => receiptRepository.findCommentsByReceipt(receipt))
        .thenAnswer((_) async => comments);

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

    await widgetTester.pump();
    expect(find.text(receiptTitle), findsOneWidget);
    verify(() => receiptRepository.findReceipt(receipt.id)).called(1);

    expect(find.text(ingredientTitle), findsOneWidget);
    verify(() => receiptRepository.findReceiptIngredientsByReceipt(receipt))
        .called(1);

    expect(find.text(cookingStepTitle), findsOneWidget);
    verify(() => receiptRepository.findCookingStepLinksByReceipt(receipt))
        .called(1);

    expect(find.text(commentText), findsOneWidget);
    verify(() => receiptRepository.findCommentsByReceipt(receipt)).called(1);
  });
}
