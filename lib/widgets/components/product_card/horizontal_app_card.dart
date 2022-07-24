import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_info.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_price_tag.dart';
import 'package:hpos_appstore/widgets/components/product_card/rectangle_product_logo.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      color: const Color(0xfffcfcfd),
      child: Container(
        width: 423,
        height: 162,
        padding:
            const EdgeInsets.only(left: 16, top: 18, right: 25, bottom: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            RectangleProductLogo(),
            ProductInfo(),
            ProductPriceTag(),
          ],
        ),
      ),
    );
  }
}
