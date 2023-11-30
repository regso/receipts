import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:receipts/features/receipt_details/data/models/receipt_ingredient_model.dart';
import 'package:receipts/features/receipt_list/data/models/receipt_list_item_model.dart';

class ReceiptListRepository {
  Future<List<ReceiptListItemModel>> getListItems() async {
    final String jsonData = await rootBundle.loadString('assets/receipts.json');
    final List<dynamic> parsedData = jsonDecode(jsonData);

    return parsedData.map((dynamic data) {
      final map = data as Map<String, dynamic>;
      final ingredients = map['ingredients'] as List<dynamic>;
      final list = ingredients
          .map(
            (dynamic item) =>
            ReceiptIngredientModel(
              title: item['title']!,
              amount: item['amount']!,
            ),
      )
          .toList();
      return ReceiptListItemModel(
        title: map['title'],
        imageLocation: map['imageLocation'],
        receiptIngredientModelList: list,
      );
    }).toList();
  }
}
