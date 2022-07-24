import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:provider/provider.dart';

class GridProductDisplay extends StatelessWidget {
  const GridProductDisplay({Key? key, required this.tag, required this.apps})
      : super(key: key);

  final String tag;
  final List<AppModel> apps;
  // final Bool? showTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Wrap(
        children: [
          ...apps
              .map((app) => ListenableProvider(
                    create: (context) => ProductProvider.fromModel(app),
                    child: const CardProductVertical(),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
