import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/widgets/components/product_card/column_product_info.dart';
import 'package:provider/provider.dart';

import 'button_install.dart';
import 'logo_product_banner.dart';

class CardProductVertical extends StatelessWidget {
  CardProductVertical({Key? key, this.isInstalled}) : super(key: key);
  bool? isInstalled = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 276.0,
        height: 299.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LogoProductBanner(),
            const Padding(padding: EdgeInsets.only(bottom: 11.0)),
            const CardDetails(),
            const Padding(padding: EdgeInsets.only(bottom: 17)),
            (isInstalled == true)
                ? Wrap(
                    children: [Container()],
                  )
                : ButtonInstall(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Numericals.double8)))
          ],
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ColumnProductInfo(),
            Column(
              children: [
                Chip(
                  backgroundColor: AppColors.primaryW25,
                  label: ValueListenableBuilder<String>(
                      valueListenable: productProvider.priceNotifier,
                      builder: (context, price, _) {
                        return Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0,
                            color: AppColors.primaryW600,
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
