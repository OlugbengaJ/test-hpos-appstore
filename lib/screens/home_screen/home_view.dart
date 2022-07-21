import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/widgets/components/vertical_app_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appData = AppModel(
        "https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg",
        "Microsoft Teams",
        "Productivity",
        "Free",
        4.5,
        70);

    return Scaffold(
      body: Center(child: VerticalAppCard(appData: appData)),
    );
  }
}

