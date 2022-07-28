import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:provider/provider.dart';

class GridProductDisplay extends StatelessWidget {
  const GridProductDisplay({Key? key, required this.apps}) : super(key: key);

  final List<Product> apps;
  // final Bool? showTitle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...apps.map((app) => ListenableProvider(
              create: (context) => ProductProvider.fromModel(app),
              child: const Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: CardProductVertical(),
              ),
            )),
      ],
    );
  }
}
