import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_list_item.dart';
import 'package:provider/provider.dart';

class ListProductDisplay extends StatelessWidget {
  const ListProductDisplay({Key? key, required this.apps}) : super(key: key);

  final List<Product> apps;
  // final Bool? showTitle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...apps
            .map((app) => ListenableProvider(
                  create: (context) => ProductProvider.fromModel(app),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: CardProductListItem(),
                  ),
                ))
            .toList(),
      ],
    );
  }
}
