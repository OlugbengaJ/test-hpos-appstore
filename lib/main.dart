import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/app_screen/app_details.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/library_screens/library_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HPOS App Store',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        LibraryScreen.route: (context) => const LibraryScreen(),
        AppDetailsView.route: (context) => const AppDetailsView(),
      },
    );
  }
}
