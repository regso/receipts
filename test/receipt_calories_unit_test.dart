import 'package:mocktail/mocktail.dart';
import 'package:receipts/features/receipt/domain/entities/ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';
import 'package:receipts/features/receipt/domain/usecases/get_receipt_calories_use_case.dart';
import 'package:test/test.dart';

class MockReceiptRepository extends Mock implements AbstractReceiptRepository {}

const receipt = ReceiptEntity(
  id: 1,
  title: 'Receipt',
  cookingTimeMinutes: 10,
  photoUrl: '',
);

final receiptIngredients = [
  ReceiptIngredientEntity(
    id: 3,
    count: 3,
    ingredient: IngredientEntity(
      id: 10,
      title: 'Ingredient 10',
      caloriesForUnit: 10,
      measureUnit: MeasureUnitEntity(id: 100, one: '', few: '', many: ''),
    ),
    receipt: receipt,
  ),
];

const sumCalories = 30;

void main() async {
  test('Check ReceiptCaloriesUseCase logic.', () async {
    final receiptRepository = MockReceiptRepository();
    when(() => receiptRepository.findReceiptIngredientsByReceipt(receipt))
        .thenAnswer((_) async => receiptIngredients);

    final getReceiptCalories =
        GetReceiptCaloriesUseCase(receiptRepository: receiptRepository);
    final calories = await getReceiptCalories.call(receipt: receipt);

    verify(() => receiptRepository.findReceiptIngredientsByReceipt(receipt))
        .called(1);
    expect(sumCalories, calories);
  });
}
