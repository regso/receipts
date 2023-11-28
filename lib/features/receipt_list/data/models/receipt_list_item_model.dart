import 'package:receipts/config/labels.dart';

class ReceiptListItemModel {
  final String title;
  final String imageLocation;

  ReceiptListItemModel({
    required this.title,
    required this.imageLocation,
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
