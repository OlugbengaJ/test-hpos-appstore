import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/screens/home_screen/home_view.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      HomeView(),
    );
  }
}
