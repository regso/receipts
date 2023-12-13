import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';

class ReceiptHeaderWidget extends StatefulWidget {
  final ReceiptModel receipt;

  const ReceiptHeaderWidget({super.key, required this.receipt});

  @override
  State<ReceiptHeaderWidget> createState() => _ReceiptHeaderWidgetState();
}

class _ReceiptHeaderWidgetState extends State<ReceiptHeaderWidget> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.receipt.title,
                    style: const TextStyle(fontSize: 24)),
              ),
              IconButton(
                icon: _liked
                    ? Image.asset(Constants.appIconLikedPath)
                    : Image.asset(Constants.appIconUnLikedPath),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 11),
              Text(
                widget.receipt.getCookingTime(),
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
              child: Image.network(
                widget.receipt.photoUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
