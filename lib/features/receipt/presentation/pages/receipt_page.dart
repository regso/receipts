import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/models/receipt_model.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_widget.dart';

class ReceiptPage extends StatelessWidget {
  final ReceiptModel receipt;

  const ReceiptPage({super.key, required this.receipt});

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
          child: ReceiptWidget(
            receipt: receipt,
          ),
        ),
      ),
    );
  }
}
