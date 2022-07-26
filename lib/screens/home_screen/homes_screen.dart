import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/screens/home_screen/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String route = '/home';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
