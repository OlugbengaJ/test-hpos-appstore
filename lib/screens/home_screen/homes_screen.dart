import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      right: Container(),
      left: const SidebarLayout(),
    );
  }
}
