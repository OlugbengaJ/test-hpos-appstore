import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/assets.dart';

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
            children: [
              InkWell(
                onTap: () => Navigator.of(context).popUntil(ModalRoute.withName('/home')),
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
                onTap: () => Navigator.pushNamed(context, "/library"),
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: ImageIcon(
                    AssetImage(AppAssets.helpPng),
                    color: Colors.white,
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
