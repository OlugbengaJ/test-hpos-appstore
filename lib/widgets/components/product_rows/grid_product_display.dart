import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:provider/provider.dart';

class GridProductDisplay extends StatelessWidget {
  GridProductDisplay({Key? key, required this.apps, this.isInstalled})
      : super(key: key);

  final List<Product> apps;
  bool? isInstalled = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...apps.map((app) => ListenableProvider(
              create: (context) => ProductProvider.fromModel(app),
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: CardProductVertical(isInstalled: isInstalled),
              ),
            )),
      ],
    );
  }
}
