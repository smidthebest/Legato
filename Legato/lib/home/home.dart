import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../auth/auth.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  _Home();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
          Positioned(
            child: SafeArea(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -10,
                      blurRadius: 60,
                      color: Colors.black.withOpacity(.20),
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    gap: 8,
                    activeColor: Colors.white,
                    iconSize: 24,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.orangeAccent,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.favorite_border,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.search,
                        text: 'Search',
                      ),
                      GButton(
                        icon: Icons.account_circle,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: _currentTabIndex,
                    onTabChange: (index) {
                      if (index != _currentTabIndex) {
                        switch (index) {
                          case 0:
                            _navigatorKey.currentState
                                .pushReplacementNamed("0");
                            break;
                          case 1:
                            _navigatorKey.currentState
                                .pushReplacementNamed("1");
                            break;
                          case 2:
                            _navigatorKey.currentState
                                .pushReplacementNamed("2");
                            break;
                          default:
                            _navigatorKey.currentState
                                .pushReplacementNamed("0");
                            break;
                        }
                        setState(() {
                          _currentTabIndex = index;
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "0":
        return MaterialPageRoute(builder: (context) => Auth());
      case "1":
        return MaterialPageRoute(builder: (context) => Auth());
      default:
        return MaterialPageRoute(
          builder: (context) => Auth(),
        );
    }
  }
}
