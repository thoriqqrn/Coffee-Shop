import 'package:coffe_shop/components/bottom_nav_bar.dart';
import 'package:coffe_shop/const.dart';
import 'package:coffe_shop/pages/cart_page.dart';
import 'package:coffe_shop/pages/menu_page.dart';
import 'package:coffe_shop/pages/setting_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    //menu page
    const MenuPage(),
    // cart page
    const CartPage(),

    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => navigateBottomBar(index),
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
