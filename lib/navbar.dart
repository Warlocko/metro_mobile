import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metromobile/homepage.dart';
import 'package:metromobile/store.dart';
import 'package:metromobile/category.dart';

class MmNavbarStateful extends StatefulWidget {
  @override
  MmNavbar createState() => MmNavbar();
}

class MmNavbar extends State<MmNavbarStateful> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MmHomepageStateful(),
    MmStoreStateful(),
    MmCategoryStateful(),
  ];

  @override
  Widget build(BuildContext context) {
    Map<int, Color> grayDisc = {
      50: Color.fromRGBO(54, 57, 63, .1),
      100: Color.fromRGBO(54, 57, 63, .2),
      200: Color.fromRGBO(54, 57, 63, .3),
      300: Color.fromRGBO(54, 57, 63, .4),
      400: Color.fromRGBO(54, 57, 63, .5),
      500: Color.fromRGBO(54, 57, 63, .6),
      600: Color.fromRGBO(54, 57, 63, .7),
      700: Color.fromRGBO(54, 57, 63, .8),
      800: Color.fromRGBO(54, 57, 63, .9),
      900: Color.fromRGBO(54, 57, 63, 1),
    };
    Map<int, Color> blueDisc = {
      50: Color.fromRGBO(114, 137, 218, .1),
      100: Color.fromRGBO(114, 137, 218, .2),
      200: Color.fromRGBO(114, 137, 218, .3),
      300: Color.fromRGBO(114, 137, 218, .4),
      400: Color.fromRGBO(114, 137, 218, .5),
      500: Color.fromRGBO(114, 137, 218, .6),
      600: Color.fromRGBO(114, 137, 218, .7),
      700: Color.fromRGBO(114, 137, 218, .8),
      800: Color.fromRGBO(114, 137, 218, .9),
      900: Color.fromRGBO(114, 137, 218, 1),
    };
    MaterialColor myGrey = MaterialColor(0xFF36393F, grayDisc);
    MaterialColor myblue = MaterialColor(0xFF7289DA, blueDisc);
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type : BottomNavigationBarType.fixed,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            title: Text(''),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.amber[800],
        backgroundColor: myblue,
      )
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}