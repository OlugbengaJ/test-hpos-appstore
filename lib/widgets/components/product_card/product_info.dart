import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/product_card/star_rating.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 5)),
        ValueListenableBuilder<String>(
          valueListenable: productProvider.nameNotifier,
          builder: (context, name, _) => Text(
            name,
            style: const TextStyle(
              fontFamily: 'Euclid Circular B',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 4)),
        ValueListenableBuilder<String>(
            valueListenable: productProvider.categoryNotifier,
            builder: (context, category, _) {
              return Text(
                category,
                style: const TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff98a2b3),
                ),
              );
            }),
        const Padding(padding: EdgeInsets.only(bottom: 8)),
        Row(
          children: [
            const StarRating(),
            ValueListenableBuilder<int>(
              valueListenable: productProvider.reviewerCountNotifier,
              builder: (context, count, _) => Text(
                '$count',
                style: const TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 8)),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Image(
              image: AssetImage('assets/icons/download_icon.png'),
            ),
            Padding(padding: EdgeInsets.only(left: 17)),
            Image(
              image: AssetImage('assets/icons/share_icon.png'),
              fit: BoxFit.scaleDown,
            )
          ],
        )
      ],
    );
  }
}
