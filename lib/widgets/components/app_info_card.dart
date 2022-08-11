import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          top,
          style: const TextStyle(
            color: AppColors.greyW500
          ),
        ),
        center,
        Text(
          bottom,
          style: const TextStyle(
            color: AppColors.greyW300
          ),
        ),
      ],
    );
  }
}