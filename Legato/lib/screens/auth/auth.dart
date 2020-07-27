import 'package:flutter/material.dart';

import '../home/home.dart';

class Auth extends StatefulWidget {
  @override
  _Auth createState() => _Auth();
}

class _Auth extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          color: Colors.white,
          child: Text("On auth now go to home "),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          },
        ),
      ),
    );
  }
}
