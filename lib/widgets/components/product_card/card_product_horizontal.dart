import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/utils_import.dart';
import 'package:hpos_appstore/widgets/components/product_card/column_product_info.dart';
import 'package:hpos_appstore/widgets/components/product_card/logo_product_rectangle.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_card_navigation.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_price_tag.dart';

class CardProductHorizontal extends StatelessWidget {
  const CardProductHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductCardNavigation(
      child: Card(
        child: Container(
          width: 423,
          height: 162,
          padding:
              const EdgeInsets.only(left: 16, top: 18, right: 25, bottom: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LogoProductRectangle(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.only(top: 5)),
                  ColumnProductInfo(),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  HorizontalCardButtons()
                ],
              ),
              const ProductPriceTag(),
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalCardButtons extends StatelessWidget {
  const HorizontalCardButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage('assets/icons/download_icon.png'),
        ),
        const Padding(padding: EdgeInsets.only(left: 17)),
        Image(
          image: AssetImage(AppAssets.shareIconPng),
          fit: BoxFit.scaleDown,
        )
      ],
    );
  }
}
