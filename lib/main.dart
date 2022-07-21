import 'package:flutter/material.dart';
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
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomeScreen(),
        "/library": (context) => LibraryScreen(),
      },
    );
  }
}
