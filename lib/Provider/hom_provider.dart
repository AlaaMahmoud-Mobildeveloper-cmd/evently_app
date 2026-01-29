import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{

   int selectedIndex=0;

  changeSelectIndex(int index){
    selectedIndex = index;
    notifyListeners();

  }
}