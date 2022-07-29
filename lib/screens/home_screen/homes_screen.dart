import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/screens/home_screen/home_view.dart';
import 'package:hpos_appstore/screens/screen_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenConfig = ScreenConfig('/home');

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
