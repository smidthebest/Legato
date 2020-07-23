import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _email;
  String get email => _email;
  set email(String value) {
    _email = value;
    notifyListeners();
  }
}
