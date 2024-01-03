import 'package:flutter/material.dart';
import 'package:onlinestore/screens/cart.dart';
import 'package:onlinestore/screens/home_screen.dart';
import 'package:onlinestore/screens/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account')
        ],
      ),
    );
  }
}
