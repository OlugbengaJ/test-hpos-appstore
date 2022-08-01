import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_list_item.dart';
import 'package:provider/provider.dart';

class ListProductDisplay extends StatelessWidget {
  const ListProductDisplay(
      {Key? key, required this.apps, this.isInstalled = false})
      : super(key: key);

  final List<Product> apps;
  final bool? isInstalled;

  // final Bool? showTitle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12,
      children: [
        ...apps
            .map(
              (app) => ListenableProvider(
                create: (context) => ProductProvider.fromModel(app),
                child: CardProductListItem(
                  isInstalled: isInstalled,
                  hasUpdate: app.updateAvailable,
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
