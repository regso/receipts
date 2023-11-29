import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt_list/data/models/receipt_list_item_model.dart';

class ReceiptDetailsWidget extends StatelessWidget {
  final ReceiptListItemModel receiptListItemModel;

  const ReceiptDetailsWidget({super.key, required this.receiptListItemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(receiptListItemModel.title,
              style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 11),
              Text(
                receiptListItemModel.getCookingTime(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppTheme.cardSubTitleColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 220.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                  receiptListItemModel.imageLocation,
                  fit: BoxFit.fitWidth
              ),
            ),
          ),
          const Text('Ингредиенты'),
          const Text('Шаги приготовления'),
          TextButton(onPressed: () {}, child: const Text('Начать готовить')),
        ],
      ),
    );
  }
}
