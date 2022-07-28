import 'package:flutter/material.dart';

class AppInfoCard extends StatelessWidget {
  const AppInfoCard({
    Key? key,
    required this.top,
    required this.bottom,
    required this.center
  }) : super(key: key);
  final String top;
  final String bottom;
  final Widget center;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              top,
              style: TextStyle(
                color: Color(0xff667085)
              ),
            ),
          ),
          center,
          Container(
            child: Text(
              bottom,
              style: TextStyle(
                color: Color(0xffD0D5DD)
              ),
            ),
          ),
        ],
      ),
    );
  }
}