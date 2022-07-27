import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


class RatingsBar extends StatelessWidget {
  const RatingsBar({
    Key? key,
    required this.star,
    required this.percent
  }) : super(key: key);
  final int star;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Text(
              "$star",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: const ImageIcon(
              AssetImage("assets/icons/star.png"),
              color: Color(0xffF79009),
            ),
          ),
          LinearPercentIndicator(
            width: 324.0,
            lineHeight: 12.0,
            percent: percent,
            backgroundColor: const Color(0xffC8CDFC),
            linearGradient: const LinearGradient(
              colors: [
                Color(0xff4758F6),
                Color(0xff919BFA),
              ]
            ),
            barRadius: const Radius.circular(16),
          ),
        ],
      ),
    );
  }
}