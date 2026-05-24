import 'package:flutter/material.dart';

import 'home_page.dart';

import 'search_page.dart';

import 'profile_page.dart';

class MainPage
    extends StatefulWidget {

  const MainPage({
    super.key
  });

  @override
  State<MainPage> createState() =>
      _MainPageState();
}

class _MainPageState
    extends State<MainPage> {

  int currentIndex = 0;

  final List<Widget> pages = [

    const HomePage(),

    const SearchPage(),

    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar:
      BottomNavigationBar(

        currentIndex:
        currentIndex,

        onTap: (index){

          setState(() {

            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}