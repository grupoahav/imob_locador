import 'package:flutter/material.dart';

class GlobalViewModel extends ChangeNotifier {
  int bottomAppBarSelectedIndex = 0;

  void onBottomAppBarItemTapped(int index) {
    bottomAppBarSelectedIndex = index;
    notifyListeners();
  }
}