import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.pizzaSlice,
        size: 20,
      ),
      label: "Рецепты",
    ),
    const BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.solidUser,
        size: 20,
      ),
      label: "Вход",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: _items,
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF2ECC71),
        unselectedItemColor: const Color(0xFFC2C2C2),
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

  Widget buildCustom(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/pizza.svg'),
              ),
              Text(
                'Рецепты',
                style: TextStyle(
                  color: Color(0xFF2ECC71),
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/user.png'),
              ),
              Text(
                'Вход',
                style: TextStyle(
                  color: Color(0xFFC2C2C2),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
