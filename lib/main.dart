import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/screens/app_screen/app_details.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/library_screens/library_screen.dart';
import 'package:hpos_appstore/screens/screen_config.dart';
import 'package:hpos_appstore/utils/utils_import.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<NavigationProvider>(
        create: (context) => NavigationProvider(),
      ),
      ChangeNotifierProvider(create: (_) => LibraryProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HPOS App Store',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'EuclidCircularB',
        primaryColor: AppColors.primaryW400,
        primaryColorLight: AppColors.primaryW25,
        primaryColorDark: AppColors.primaryW600,

        // general theme for inputs e.g. text field
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          iconColor: AppColors.primaryW400,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryW100),
            borderRadius: BorderRadius.circular(Numericals.double8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryW400),
            borderRadius: BorderRadius.circular(Numericals.double8),
          ),
        ),
      ),
      home: const Center(child: NavigationManager()),
    );
  }
}

class NavigationManager extends StatelessWidget {
  const NavigationManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    return ValueListenableBuilder<ScreenConfig>(
      valueListenable: navigationProvider.selectedPane,
      builder: (context, selectedPane, _) {
        var selectedScreen = selectScreen(selectedPane);
        return AppLayout(content: selectedScreen);
      },
    );
  }

  Widget selectScreen(ScreenConfig screenConfig) {
    if (screenConfig == HomeScreen.screenConfig) {
      return const HomeScreen();
    } else if (screenConfig == LibraryScreen.screenConfig) {
      return const LibraryScreen();
    } else {
      return ListenableProvider(
        create: (context) => ProductProvider(),
        child: const AppDetailsView(),
      );
    }
  }
}
