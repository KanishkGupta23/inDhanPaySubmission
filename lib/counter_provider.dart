import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int counter = 0;
  int get count => counter;

  void add(){
    counter++;
    notifyListeners();
  }

  void subtract(){
    counter--;
    notifyListeners();
  }
}