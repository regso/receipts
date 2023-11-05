import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../config/app_theme.dart';
import '../../../config/labels.dart';

class ReceiptBottomNavigationBar extends StatefulWidget {
  const ReceiptBottomNavigationBar({
    super.key,
  });

  @override
  State<ReceiptBottomNavigationBar> createState() =>
      _ReceiptBottomNavigationBarState();
}

class _ReceiptBottomNavigationBarState
    extends State<ReceiptBottomNavigationBar> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.pizzaSlice,
        size: 20,
      ),
      label: Labels.receipts,
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(
        FontAwesomeIcons.solidUser,
        size: 20,
      ),
      label: Labels.signIn,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.navBarShadowColor,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        items: _items,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppTheme.navBarSelectedItemColor,
        unselectedItemColor: AppTheme.navBarUnSelectedItemColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
