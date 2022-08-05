import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

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
          return CardNetworkImage(
            logo: image,
            width: logoWidth,
            height: logoHeight,
          );
        },
      ),
    );
  }
}

class CardNetworkImage extends StatelessWidget {
  const CardNetworkImage(
      {Key? key, required this.logo, this.width = 62.13, this.height = 58.0})
      : super(key: key);

  final String logo;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        logo,
        width: width,
        height: height,
        fit: BoxFit.fill,
        semanticLabel: 'App Logo',
        errorBuilder: (context, obj, _) => Image.asset('assets/images/broken.png', fit: BoxFit.fill,),
      ),

      // todo: find a way to show svg images.
      // child: SvgPicture.network(
      //   logo,
      //   width: width,
      //   height: height,
      //   semanticsLabel: 'App Logo',
      //   fit: BoxFit.contain,
      //   placeholderBuilder: (BuildContext context) => Container(
      //       padding: const EdgeInsets.all(30.0),
      //       child: const CircularProgressIndicator()),
      // ),
    );
  }
}
