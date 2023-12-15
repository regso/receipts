import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/labels.dart';

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
      icon: Image.asset(Constants.appIconPizzaPath),
      activeIcon: Image.asset(Constants.appIconPizzaActivePath),
      label: Labels.receipts,
    ),
    BottomNavigationBarItem(
      icon: Image.asset(Constants.appIconUserPath),
      activeIcon: Image.asset(Constants.appIconUserActivePath),
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
