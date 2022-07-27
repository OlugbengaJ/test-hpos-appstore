import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_list_item.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import 'card_product_horizontal.dart';

class ProductCardPreview extends StatelessWidget {
  const ProductCardPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        const CardProductHorizontal(),
        const Padding(padding: EdgeInsets.all(7)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () => productProvider.rating--,
              child: const Text('Decrease'),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            MaterialButton(
              color: Colors.blue,
              onPressed: () => productProvider.rating++,
              child: const Text('Increase'),
            ),
          ],
        ),
        const CardProductListItem()
      ],
    );
  }
}
