import 'package:receipts/features/receipt/data/dto/remote_ingredient_dto.dart';

class IngredientModel {
  final int id;
  final String title;
  final String amount;

  IngredientModel._({
    required this.id,
    required this.title,
    required this.amount,
  });

  factory IngredientModel.fromRemoteReceiptDto(RemoteIngredientDto ingredientDto) {
    return IngredientModel._(
      id: ingredientDto.id,
      title: ingredientDto.name,
      amount: '',
    );
  }
}
