// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:receipts/features/receipt_details/data/models/comment_model.dart';
// import 'package:receipts/features/receipt_details/data/models/cooking_step_model.dart';
// import 'package:receipts/features/receipt/data/dto/ingredient_model.dart';
import 'package:receipts/features/receipt/data/dto/receipt_model.dart';

class ReceiptListRepository {
  Future<List<ReceiptModel>> getListItems() async {
    return [];
  }

  /*
  Future<List<ReceiptModel>> getListItems2() async {
    final String jsonData = await rootBundle.loadString('assets/receipts.json');
    final List<dynamic> parsedData = jsonDecode(jsonData);

    return parsedData.map((dynamic data) {
      final map = data as Map<String, dynamic>;
      final ingredients = map['ingredients'] as List<dynamic>;
      final ingredientList = ingredients
          .map(
            (dynamic item) =>
            ReceiptIngredientModel(
              title: item['title']!,
              amount: item['amount']!,
            ),
      )
          .toList();
      final cookingSteps = map['cookingSteps'] as List<dynamic>;
      final cookingStepList = cookingSteps
          .map(
            (dynamic item) =>
            CookingStepModel(
              title: item['description']!,
              cookingTimeMinutes: item['cookingTimeMinutes']!,
            ),
      )
          .toList();
      final comments = map['comments'] as List<dynamic>;
      final commentList = comments
          .map(
            (dynamic item) =>
            CommentModel(
              text: item['text']!,
            ),
      )
          .toList();
      return ReceiptModel(
        name: map['title'],
        photo: map['imageLocation'],
        duration: 0,
        receiptIngredientModelList: ingredientList,
        cookingStepModelList: cookingStepList,
        commentModelList: commentList,
      );
    }).toList();
  }
   */
}
