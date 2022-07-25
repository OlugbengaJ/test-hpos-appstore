import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/app_screen/app_details.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/library_screens/library_screen.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:provider/provider.dart';

import '../../providers/navigation_provider.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          SizedBox(child: Image.asset(AppAssets.hpLogoPng)),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              InkWell(
                onTap: () => navigationProvider.navigateTo(HomeScreen.route),
                child: SizedBox(
                  child: ImageIcon(
                    AssetImage(AppAssets.homePng),
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => navigationProvider.navigateTo(LibraryScreen.route),
                child: SizedBox(
                  child: ImageIcon(
                    AssetImage(AppAssets.laptopPng),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () =>
                      navigationProvider.navigateTo(AppDetailsView.route),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ImageIcon(
                      AssetImage(AppAssets.helpPng),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
