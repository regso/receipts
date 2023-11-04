class ReceiptListItemModel {
  final String title;
  final int cookingTimeMinutes;
  final String imageLocation;

  ReceiptListItemModel({
    required this.title,
    required this.cookingTimeMinutes,
    required this.imageLocation,
  });

  String getCookingTime() {
    int hours = cookingTimeMinutes ~/ 60;
    int minutes = cookingTimeMinutes % 60;
    return (cookingTimeMinutes > 120)
        ? '$hours часа $minutes минут'
        : (cookingTimeMinutes > 60)
          ? '1 час $minutes минут'
          : '$cookingTimeMinutes минут';
  }
}
