import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/product_card/rating_view.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';

class ColumnProductInfo extends StatelessWidget {
  const ColumnProductInfo({Key? key, this.headerOnly = false}) : super(key: key);

  final bool headerOnly;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return SizedBox(
      width: 165,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<String>(
            valueListenable: productProvider.nameNotifier,
            builder: (context, name, _) => Text(
              name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.greyW900,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 4.0)),
          ValueListenableBuilder<String>(
              valueListenable: productProvider.categoryNotifier,
              builder: (context, category, _) {
                return Text(
                  category,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyW400,
                  ),
                );
              }),
          if (!headerOnly)
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 12)),
              const RatingView(),
              const Padding(padding: EdgeInsets.only(right: 8)),
              ValueListenableBuilder<int>(
                valueListenable: productProvider.reviewerCountNotifier,
                builder: (context, count, _) => Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyW900,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
