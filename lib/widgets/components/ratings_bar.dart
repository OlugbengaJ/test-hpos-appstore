import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
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
              star.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: ImageIcon(
              AssetImage(
                AppAssets.starPng
              ),
              color: AppColors.orange,
            ),
          ),
          LinearPercentIndicator(
            width: 324.0,
            lineHeight: 12.0,
            percent: percent,
            backgroundColor: AppColors.primaryW100,
            linearGradient: const LinearGradient(
              colors: AppColors.gradientBlueW500
            ),
            barRadius: const Radius.circular(16),
          ),
        ],
      ),
    );
  }
}