import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt_details/data/models/receipt_ingredient_model.dart';

class ReceiptListItemModel {
  final String title;
  final String imageLocation;
  final List<ReceiptIngredientModel> receiptIngredientModelList;

  ReceiptListItemModel({
    required this.title,
    required this.imageLocation,
    required this.receiptIngredientModelList,
  });

  String getCookingTime() {
    int cookingTimeMinutes = 0;
    int hours = cookingTimeMinutes ~/ 60;
    int minutes = cookingTimeMinutes % 60;
    return (cookingTimeMinutes > 120)
        ? '$hours ${Labels.hours} $minutes ${Labels.minutes}'
        : (cookingTimeMinutes > 60)
            ? '1 ${Labels.hour} $minutes ${Labels.minutes}'
            : '$cookingTimeMinutes ${Labels.minutes}';
  }
}
