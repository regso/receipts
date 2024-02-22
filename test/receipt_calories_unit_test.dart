import 'package:mocktail/mocktail.dart';
import 'package:receipts/features/receipt/domain/entities/ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/entities/measure_unit_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';
import 'package:receipts/features/receipt/domain/usecases/get_receipt_calories_use_case.dart';
import 'package:test/test.dart';

class MockReceiptRepository extends Mock implements AbstractReceiptRepository {
  @override
  Future<List<ReceiptIngredientEntity>> findReceiptIngredientsByReceipt(
    ReceiptEntity receipt,
  ) async {
    final measureUnit = MeasureUnitEntity(id: 100, one: '', few: '', many: '');
    final ingredient = IngredientEntity(
      id: 10,
      title: 'Ingredient 10',
      caloriesForUnit: 10,
      measureUnit: measureUnit,
    );
    return [
      ReceiptIngredientEntity(
        id: 3,
        count: 3,
        ingredient: ingredient,
        receipt: receipt,
      ),
    ];
  }
}

void main() async {
  final receiptRepository = MockReceiptRepository();
  final getReceiptCalories =
      GetReceiptCaloriesUseCase(receiptRepository: receiptRepository);
  const receipt = ReceiptEntity(
    id: 1,
    title: 'Receipt',
    cookingTimeMinutes: 10,
    photoUrl: '',
  );
  final calories = await getReceiptCalories(receipt: receipt);

  test('Test ReceiptCaloriesUseCase logic.', () {
    expect(30, calories);
  });
}
