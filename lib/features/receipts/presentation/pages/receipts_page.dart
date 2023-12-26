import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipts/presentation/widgets/navigation_bar_widget.dart';
import 'package:receipts/features/receipts/presentation/widgets/receipts_widget.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: ReceiptsWidget(),
      ),
      bottomNavigationBar: const NavigationBarWidget(),
    );
  }
}
