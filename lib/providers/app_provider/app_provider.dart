import 'package:flutter/material.dart';

// Only for testing purposes
class AppProvider extends ChangeNotifier {
  ValueNotifier<bool> installed = ValueNotifier(false);


  // To be called when trying to install an application
  void install(){
    installed = ValueNotifier(true);
    notifyListeners();
  }


  void uninstall(){
    installed = ValueNotifier(false);
    notifyListeners();
  }
}