import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shareweb/MainScreens/favourites.dart';
import 'package:shareweb/MainScreens/homepage.dart';
import 'package:shareweb/MainScreens/screen.dart';
import 'package:shareweb/MainScreens/profile.dart';
import 'package:shareweb/MainScreens/bonus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _screenNumber = 0;
  final List<Widget> _children = [
    HomePagePage(),
    SearchPage(),
    BonusPage(),
    FavouritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _children[_screenNumber],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            new BottomNavigationBarItem(
              title: Text('Bonus'),
              icon: Icon(CupertinoIcons.flame_fill),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favourites'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
          currentIndex: _screenNumber,
          selectedItemColor: Colors.teal,
          onTap: (i) => setState(() {
            _screenNumber = i;
          }),
        ),
      ),
    );
  }
}
