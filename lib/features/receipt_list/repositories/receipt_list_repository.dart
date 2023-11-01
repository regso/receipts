import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/receipt_list_item_model.dart';

class ReceiptListRepository {
  Future<List<ReceiptListItemModel>> getListItems() async {
    final String jsonData = await rootBundle.loadString('assets/receipts.json');
    final List<dynamic> parsedData = jsonDecode(jsonData);
    return parsedData.map((dynamic data) {
      final map = data as Map<String, dynamic>;
      return ReceiptListItemModel(
        title: map['title'],
        cookingTimeMinutes: map['cookingTimeMinutes'],
        imageLocation: map['imageLocation'],
      );
    }).toList();
  }
}
