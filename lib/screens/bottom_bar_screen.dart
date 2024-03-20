import 'package:flutter/material.dart';
import 'package:grocery/provider/dark_theme_provider.dart';
import 'package:grocery/screens/home.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';
import 'categories_screen.dart';
import 'user_screen.dart';

class BottombarScreen extends StatefulWidget {
  const BottombarScreen({super.key});

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _seletedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List _pages = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const UserScreen(),
    ];
    void _selectedPage(int index) {
      setState(() {
        _seletedIndex = index;
      });
    }

    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;

    return Scaffold(
      body: _pages[_seletedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _seletedIndex,
          onTap: _selectedPage,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  Icon(_seletedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(_seletedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(_seletedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    _seletedIndex == 3 ? IconlyBold.user_2 : IconlyLight.user),
                label: 'user')
          ]),
    );
  }
}
