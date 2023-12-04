import 'dart:math';

// import 'package:json_annotation/json_annotation.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt_details/data/models/comment_model.dart';
import 'package:receipts/features/receipt_details/data/models/cooking_step_model.dart';
import 'package:receipts/features/receipt/data/models/receipt_ingredient_model.dart';

// part 'receipt_model.g.dart';

// @JsonSerializable()
class ReceiptModel {
  final String title;
  final String imageLocation;
  final int cookingTimeMinutes;
  final List<ReceiptIngredientModel> receiptIngredientModelList;
  final List<CookingStepModel> cookingStepModelList;
  final List<CommentModel> commentModelList;

  ReceiptModel({
    required this.title,
    required this.imageLocation,
    required this.cookingTimeMinutes,
    required this.receiptIngredientModelList,
    required this.cookingStepModelList,
    required this.commentModelList,
  });

  // factory ReceiptModel.fromJson(Map<String, dynamic> json) => _$ReceiptModelFromJson(json);

  // Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);

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