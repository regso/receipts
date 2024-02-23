import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';
import 'package:receipts/features/receipt/domain/usecases/get_favorites_map_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_favorite_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

class MockReceiptRepository extends Mock implements AbstractReceiptRepository {}

void main() {
  testWidgets('Test favorites switch.', (widgetTester) async {
    const receipt = ReceiptEntity(
      id: 3,
      title: 'title',
      cookingTimeMinutes: 10,
      photoUrl: '',
    );

    final receiptRepository = MockReceiptRepository();
    when(() => receiptRepository.findFavorites()).thenAnswer((_) async => []);
    when(() => receiptRepository.saveFavorite(receipt.id))
        .thenAnswer((_) async {});

    final sl = GetIt.instance;
    sl.registerLazySingleton(
      () => GetFavoritesMapUseCase(receiptRepository: receiptRepository),
    );
    sl.registerLazySingleton(
      () => SaveFavoriteUseCase(receiptRepository: receiptRepository),
    );

    await widgetTester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: BlocProvider<HeaderBloc>(
          create: (BuildContext context) {
            final bloc = HeaderBloc();
            bloc.add(LoadHeaderEvent(receiptId: receipt.id));
            return bloc;
          },
          child: const ReceiptHeaderWidget(receipt: receipt),
        ),
      ),
    );
    verify(() => receiptRepository.findFavorites()).called(1);

    await widgetTester.pump();
    await widgetTester.tap(find.byType(GestureDetector));
    verify(() => receiptRepository.saveFavorite(receipt.id)).called(1);
  });
}
