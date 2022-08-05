import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/images/centered_image.dart';
import 'package:provider/provider.dart';

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
        child: ValueListenableBuilder<String>(
          valueListenable: productProvider.imageNotifier,
          builder: (context, logo, _) => CenteredImage(
            logo: logo,
            semanticLabel: 'App Logo',
          ),
        ),
      ),
    );
  }
}
