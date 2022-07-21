import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import 'horizontal_app_card.dart';

class ProductCardPreview extends StatelessWidget {
  const ProductCardPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        const HorizontalProductCard(),
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
      ],
    );
  }
}
