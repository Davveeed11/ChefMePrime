import 'package:chefmeprime/screen/Favorites.dart';
import 'package:chefmeprime/screen/HomePage.dart';
import 'package:chefmeprime/screen/Profile.dart';
import 'package:chefmeprime/screen/settings.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      backgroundColor: Theme.of(context).colorScheme.secondary,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_favorites_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_favorites_filled),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: 'profile'),
        ],
      ),
    );
  }

  final List<Widget> pages = <Widget>[
    HomePage(),
    Favorites(),
    Setting(),
  ];
}
