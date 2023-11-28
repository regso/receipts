import 'package:flutter/material.dart';
import '../../../config/app_theme.dart';
import '../widgets/receipt_bottom_navigation_bar.dart';
import '../widgets/receipt_list.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: ReceiptList(),
        ),
      ),
      bottomNavigationBar: const ReceiptBottomNavigationBar(),
    );
  }
}
