import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';

class ProductPriceTag extends StatelessWidget {
  const ProductPriceTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Provider.of<ProductProvider>(context).priceNotifier,
      builder: (context, price, _) {
        return Chip(
          backgroundColor: AppColors.primaryW25,
          label: Text(
            '$price',
            style: TextStyle(
              color: AppColors.primaryW600,
            ),
          ),
        );
      },
    );
  }
}
