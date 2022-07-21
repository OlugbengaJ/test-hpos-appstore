import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';

class ButtonGradient extends StatelessWidget {
  const ButtonGradient({
    Key? key,
    required this.gradient,
    required this.text,
    this.radius = 0,
  }) : super(key: key);

  final Gradient gradient;
  final Text text;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient,
        ),
        child: InkWell(
          onTap: () {},
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: text,
          ),
        ),
      ),
    );
  }
}
