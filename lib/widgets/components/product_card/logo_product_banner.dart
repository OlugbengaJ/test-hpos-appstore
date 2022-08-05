import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../providers/product_provider.dart';
import '../../../utils/colors.dart';

class LogoProductBanner extends StatelessWidget {
  const LogoProductBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius circularEdge = const Radius.circular(16.0);
    var productProvider = Provider.of<ProductProvider>(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [AppColors.greyW900, Color(0xff344054), Color(0xff1D2939)],
        ),
        borderRadius:
        BorderRadius.only(topLeft: circularEdge, topRight: circularEdge),
      ),
      child: SizedBox(
        width: 244.0,
        height: 127.0,
        child: Center(
          child: ValueListenableBuilder<String>(
              valueListenable: productProvider.imageNotifier,
              builder: (context, logo, _) {
                return Image.network(
                  logo,
                  width: 58.0,
                  height: 58.0,
                  fit: BoxFit.cover,
                  semanticLabel: 'App Logo',
                  errorBuilder: (context, obj, _) => Image.asset('assets/images/broken.png', fit: BoxFit.fill,),
                );

                // todo: find a way to show svg images.
                // return SvgPicture.network(
                //   logo,
                //   width: 62.13,
                //   height: 58.0,
                //   semanticsLabel: 'App Logo',
                //   placeholderBuilder: (BuildContext context) => Container(
                //     padding: const EdgeInsets.all(30.0),
                //     child: const CircularProgressIndicator(),
                //   ),
                // );
              }),
        ),
      ),
    );
  }
}
