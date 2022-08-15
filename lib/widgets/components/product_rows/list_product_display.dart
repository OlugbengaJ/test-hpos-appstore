import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_list_item.dart';
import 'package:provider/provider.dart';

class ListProductDisplay extends StatelessWidget {
  const ListProductDisplay(
      {Key? key, required this.apps, this.isInstalled = false})
      : super(key: key);

  final List<Product> apps;
  final bool? isInstalled;

  @override
  Widget build(BuildContext context) {
    var libraryProvider = Provider.of<LibraryProvider>(context);

    return ValueListenableBuilder<bool>(
        valueListenable: libraryProvider.loadingNotifier,
        builder: (context, loading, _) {
          return loading
              ? const Center(child: CircularProgressIndicator())
              : Wrap(
                  runSpacing: 12,
                  children: [
                    ...apps
                        .map(
                          (app) => ListenableProvider(
                            create: (context) => ProductProvider.fromModel(app),
                            child: CardProductListItem(
                              hasUpdate: app.applicationInfo?.updateAvailable,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                );
        });
  }
}
