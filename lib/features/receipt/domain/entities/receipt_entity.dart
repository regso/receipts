import 'dart:math';

import 'package:receipts/config/labels.dart';

class ReceiptEntity {
  final int id;
  final String title;
  final int cookingTimeMinutes;
  final String photoUrl;

  const ReceiptEntity({
    required this.id,
    required this.title,
    required this.cookingTimeMinutes,
    required this.photoUrl,
  });

  String getCookingTime() {
    int hours = cookingTimeMinutes ~/ 60;
    int minutes = cookingTimeMinutes % 60;
    String time = '';
    if (hours > 0) {
      time += '$hours ${getMorph(hours, [
            Labels.hour1,
            Labels.hour2,
            Labels.hour3
          ])} ';
    }
    if (minutes > 0) {
      time += '$minutes ${getMorph(minutes, [
            Labels.minute1,
            Labels.minute2,
            Labels.minute3
          ])} ';
    }
    return time;
  }

  String getMorph(int n, List<String> threeTitles) {
    List<int> cases = [2, 0, 1, 1, 1, 2];
    return threeTitles[
        (n % 100 > 4 && n % 100 < 20) ? 2 : cases[min(n % 10, 5)]];
  }
}
