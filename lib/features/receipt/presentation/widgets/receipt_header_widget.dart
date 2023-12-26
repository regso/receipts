import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptHeaderWidget extends StatefulWidget {
  final ReceiptEntity _receipt;

  const ReceiptHeaderWidget({super.key, required ReceiptEntity receipt})
      : _receipt = receipt;

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
                child: Text(widget._receipt.title,
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
                widget._receipt.getCookingTime(),
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
              child: widget._receipt.photoUrl != ''
                  ? Image.network(
                      widget._receipt.photoUrl,
                      fit: BoxFit.cover,
                    )
                  : ColoredBox(color: AppTheme.cardImageBackgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
