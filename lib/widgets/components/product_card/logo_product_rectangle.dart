import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';

class LogoProductRectangle extends StatelessWidget {
  const LogoProductRectangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return Container(
      width: 127,
      height: 127,
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
          return NetworkImage(logo: image);
          // return Image(
          //   image: AssetImage(image),
          //   fit: BoxFit.scaleDown,
          // );
        },
      ),
    );
  }
}

class NetworkImage extends StatelessWidget {
  const NetworkImage({Key? key, required this.logo}) : super(key: key);

  final String logo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 244.0,
      height: 127.0,
      child: Center(
        child: SvgPicture.network(
          logo,
          width: 62.13,
          height: 58.0,
          semanticsLabel: 'App Logo',
          placeholderBuilder: (BuildContext context) => Container(
              padding: const EdgeInsets.all(30.0),
              child: const CircularProgressIndicator()),
        ),
      ),
    );
  }
}