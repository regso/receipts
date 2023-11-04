import 'package:flutter/material.dart';
import '../widgets/receipt_bottom_navigation_bar.dart';
import '../widgets/receipt_list.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: ReceiptList(),
        ),
      ),
      bottomNavigationBar: ReceiptBottomNavigationBar(),
    );
  }
}
