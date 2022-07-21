import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_card_preview.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      Center(
        child: ListenableProvider(
          create: (context) => ProductProvider(),
          child: const ProductCardPreview(),
        ),
      ),
    );
  }
}
