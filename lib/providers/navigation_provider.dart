import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';

class NavigationProvider extends ChangeNotifier {
  var selectedPane = ValueNotifier(HomeScreen.route);

  void navigateTo(String route) => selectedPane.value = route;
}
