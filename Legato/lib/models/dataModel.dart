import 'package:flutter/material.dart';

class DataModel extends ChangeNotifier {
  List<String> _audios = new List<String>();

  List<String> get audios => _audios;

  set audios(List<String> val) {
    _audios = val;
  }
}
