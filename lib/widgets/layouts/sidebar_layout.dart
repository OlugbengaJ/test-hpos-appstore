import 'package:flutter/material.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          SizedBox(child: Image.asset("assets/images/hp_logo.png")),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: const [
              SizedBox(
                child: ImageIcon(
                  AssetImage("assets/icons/home.png"),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ImageIcon(
                  AssetImage("assets/icons/laptop.png"),
                  color: Colors.white,
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
                  child: const ImageIcon(
                    AssetImage("assets/icons/help.png"),
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
