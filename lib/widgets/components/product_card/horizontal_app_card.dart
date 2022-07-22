import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/product_card/star_rating.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 423,
      height: 162,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Color(0xfffcfcfd),
      ),
      padding: const EdgeInsets.only(left: 16, top: 18, right: 25, bottom: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          RectangleAppLogo(),
          AppInfo(),
          PriceTag(),
        ],
      ),
    );
  }
}

class RectangleAppLogo extends StatelessWidget {
  const RectangleAppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Container(
      width: 127,
      height: 127,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff101828), Color(0xff344054), Color(0xff1d2939)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ValueListenableBuilder<String>(
          valueListenable: productProvider.imageNotifier,
          builder: (context, image, _) {
            return Image(
              image: AssetImage(image),
              fit: BoxFit.scaleDown,
            );
          }),
    );
  }
}

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

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
            // Image(
            //   image: AssetImage('assets/icons/share_icon'),
            //   fit: BoxFit.scaleDown,
            // )
          ],
        )
      ],
    );
  }
}

class PriceTag extends StatelessWidget {
  const PriceTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Provider.of<ProductProvider>(context).priceNotifier,
        builder: (context, price, _) {
          return Container(
            width: 58,
            height: 23,
            padding: const EdgeInsets.only(top: 9),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Text('\$$price'),
          );
        });
  }
}
