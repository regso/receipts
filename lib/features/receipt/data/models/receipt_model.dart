import 'dart:math';

import 'package:hive/hive.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/dto/remote_receipt_dto.dart';

part 'receipt_model.g.dart';

@HiveType(typeId: 0)
class ReceiptModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int cookingTimeMinutes;
  @HiveField(3)
  String photoUrl;
  @HiveField(4)
  bool isOnline;

  ReceiptModel({
    required this.id,
    required this.title,
    required this.cookingTimeMinutes,
    required this.photoUrl,
    required this.isOnline,
  });

  factory ReceiptModel.fromRemoteReceiptDto(RemoteReceiptDto receiptDto) {
    return ReceiptModel(
      id: receiptDto.id,
      title: receiptDto.name,
      cookingTimeMinutes: receiptDto.duration,
      photoUrl: receiptDto.photo,
      isOnline: true,
    );
  }

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
