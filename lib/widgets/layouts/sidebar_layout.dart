import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/app_screen/app_details.dart';
import 'package:hpos_appstore/screens/home_screen/homes_screen.dart';
import 'package:hpos_appstore/screens/library_screens/library_screen.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/widgets/components/nav_item.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          SizedBox(child: Image.asset(AppAssets.hpLogoPng)),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: const [
              NavItem(
                screenConfig: HomeScreen.screenConfig,
                asset: AppAssets.homePng,
              ),
              SizedBox(
                height: 34,
              ),
              NavItem(
                screenConfig: LibraryScreen.screenConfig,
                asset: AppAssets.laptopPng,
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: NavItem(
                    screenConfig: AppDetailsView.screenConfig,
                    asset: AppAssets.helpPng,
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
