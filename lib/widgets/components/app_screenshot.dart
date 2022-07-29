import 'package:flutter/material.dart';


class AppScreenShot extends StatelessWidget {
  const AppScreenShot({Key? key, required this.image }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 403,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image(
        image: AssetImage(image),
        height: 403,
      ),
    );
  }
}