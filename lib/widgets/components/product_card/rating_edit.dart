import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AppRatingsWidget extends StatelessWidget {
  const AppRatingsWidget({Key? key, required this.ratings}) : super(key: key);

  final double ratings;

  @override
  Widget build(BuildContext context) {
    const starSize = 18.0;

    int getFractionalPart() {
      return ratings.toInt();
    }

    int getUnfilledPart() {
      return 5 - ratings.round();
    }

    double getDecimalPart() {
      return ratings - ratings.truncate();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          getFractionalPart(),
              (index) =>
          const Icon(Icons.star, color: AppColors.orange, size: starSize),
        ),
        if (getDecimalPart() > 0)
          const Icon(Icons.star_half, color: AppColors.orange, size: starSize),
        ...List.generate(
          getUnfilledPart(),
              (index) => const Icon(Icons.star_outline,
              color: AppColors.orange, size: starSize),
        ),
      ],
    );
  }
}
