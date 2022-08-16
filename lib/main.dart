import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/app_provider/app_provider.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/providers/navigation_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/screens/screens.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:hpos_appstore/widgets/components/texts/search_bar_import.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';
import 'package:hpos_appstore/widgets/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<NavigationProvider>(
        create: (context) => NavigationProvider(),
      ),
      ListenableProvider<SearchBarProvider>(
          create: (context) => SearchBarProvider()),
      ChangeNotifierProvider(create: (_) => LibraryProvider()),
      ChangeNotifierProvider(create: (_) => AppProvider()),
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
      theme: appTheme,
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
        var selectedScreen = selectScreen(selectedPane, navigationProvider);
        return AppLayout(content: selectedScreen);
      },
    );
  }

  Widget selectScreen(
      ScreenConfig screenConfig, NavigationProvider navigationProvider) {
    navigationProvider.scrollToTop();
    if (screenConfig == HomeScreen.screenConfig) {
      return const HomeScreen();
    } else if (screenConfig == LibraryScreen.screenConfig) {
      return const LibraryScreen();
    } else {
      return ValueListenableBuilder<ProductProvider?>(
        valueListenable: navigationProvider.product,
        builder: (context, productProvider, _) {
          return ListenableProvider(
            create: (context) => productProvider ?? ProductProvider(context),
            child: const AppDetailsView(),
          );
        },
      );
    }
  }
}
