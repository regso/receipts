import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt_list/presentation/widgets/receipt_bottom_navigation_bar.dart';
import 'package:receipts/features/receipt_list/presentation/widgets/receipt_list.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: const SafeArea(
        child: ReceiptList(),
      ),
      bottomNavigationBar: const ReceiptBottomNavigationBar(),
    );
  }
}
