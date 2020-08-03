import 'package:Legato/screens/media/audio.dart';
import 'package:Legato/screens/podcast/podcastPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../auth/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: GNav(
                    gap: MediaQuery.of(context).size.width / 67.5,
                    activeColor: Colors.white,
                    iconSize: MediaQuery.of(context).size.width / 22.5,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 27,
                      vertical: 5,
                    ),
                    duration: Duration(milliseconds: 800),
                    tabBackgroundColor: Colors.orangeAccent,
                    tabs: [
                      GButton(
                        icon: FontAwesomeIcons.music,
                        text: 'Music',
                      ),
                      GButton(
                        icon: FontAwesomeIcons.tools,
                        text: 'Resources',
                      ),
                      GButton(
                        icon: FontAwesomeIcons.podcast,
                        text: 'Podcast',
                      ),
                      GButton(
                        icon: FontAwesomeIcons.userAlt,
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
                          case 2:
                            _navigatorKey.currentState
                                .pushReplacementNamed("3");
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
        return MaterialPageRoute(builder: (context) => Audio());
      case "1":
        return MaterialPageRoute(builder: (context) => Auth());
      case "2":
        return MaterialPageRoute(builder: (context) => PodcastPage());
      default:
        return MaterialPageRoute(
          builder: (context) => Audio(),
        );
    }
  }
}
