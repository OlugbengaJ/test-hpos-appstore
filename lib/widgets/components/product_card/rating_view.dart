import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return SizedBox(
      height: 18,
      child: ValueListenableBuilder<double>(
        valueListenable: productProvider.ratingNotifier,
        builder: (context, rating, _) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                rating.floor(),
                (index) => const Icon(
                  Icons.star,
                  color: AppColors.orange,
                  size: 18,
                ),
              ),
              if (rating - rating.floor() >= 0.5)
                const Icon(
                  Icons.star_half,
                  color: AppColors.orange,
                  size: 18,
                ),
            ],
          );
        },
      ),
    );
  }
}
