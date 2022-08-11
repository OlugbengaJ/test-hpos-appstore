import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/widgets/components/images/centered_image.dart';
import 'package:provider/provider.dart';

class LogoProductRectangle extends StatelessWidget {
  const LogoProductRectangle({
    Key? key,
    this.borderLength = 127,
    this.logoWidth = 62.13,
    this.logoHeight = 58.0,
  }) : super(key: key);

  final double borderLength;
  final double logoWidth;
  final double logoHeight;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Container(
      width: borderLength,
      height: borderLength,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff101828), Color(0xff344054), Color(0xff1d2939)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ValueListenableBuilder<String>(
        valueListenable: productProvider.imageNotifier,
        builder: (context, image, _) {
          return CenteredImage(
            logo: image,
            width: logoWidth,
            height: logoHeight,
            semanticLabel: 'App Logo',
          );
        },
      ),
    );
  }
}
