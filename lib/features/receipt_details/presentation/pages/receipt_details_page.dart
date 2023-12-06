import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/receipt_details_widget.dart';

class ReceiptDetailsPage extends StatelessWidget {
  final ReceiptModel receiptListItemModel;

  const ReceiptDetailsPage({super.key, required this.receiptListItemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.receiptDetailsBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.receiptDetailsAppBarShadowColor,
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: AppBar(
            title: Text(Labels.receipt),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppTheme.receiptDetailsBackgroundColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/images/horn.png'),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ReceiptDetailsWidget(
            receipt: receiptListItemModel,
          ),
        ),
      ),
    );
  }
}
