import 'package:app1/food_screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'user_screen.dart';
import 'food_screen.dart';
import 'map_screen.dart';
import 'plus_screen.dart';
import 'chat_screen.dart';
import 'chat_screen2.dart';

class bottombar extends StatefulWidget {
  @override
  _bottombar createState() => _bottombar();
}

class _bottombar extends State<bottombar> {
  // bottom네이게이션 바를 사용하기 위해 현재 홈화면을 index 1번으로 설정
  int currentIndex = 0;
  // 0번 foodscreen , 1번

  final screens =[
    //FoodScreen(),
    FoodScreen2(),
    MapScreen(),
    PlusScreen(),
    //ChatScreen2(),
    ChatScreen(),
    UserScreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: 'dd',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'ddd',
              icon: Icon(Icons.location_pin),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'dddd',
              icon: Icon(Icons.add_circle_rounded),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'dddddd',
              icon: Icon(Icons.message),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              label: 'dddeu',
              icon: Icon(Icons.supervised_user_circle),
              backgroundColor: Colors.white,
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      );
  }
}