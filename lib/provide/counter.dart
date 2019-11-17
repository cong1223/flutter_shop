import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int value = 10;

  increment() {
    this.value ++;
    notifyListeners();
  }
}