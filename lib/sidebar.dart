import 'package:flutter/material.dart';


class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 111,
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          SizedBox(
            child: Image.asset("assets/images/hp_logo.png")
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: const [
              SizedBox(
                child:  ImageIcon(
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