import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/product_card/column_product_info.dart';
import 'package:provider/provider.dart';

import 'logo_product_banner.dart';

class CardProductVertical extends StatelessWidget {
  const CardProductVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Numericals.double16)),
      ),
      child: Container(
        width: 276.0,
        height: 299.0,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            LogoProductBanner(),
            Padding(padding: EdgeInsets.only(bottom: 16.0)),
            CardDetails(),
            Padding(padding: EdgeInsets.only(bottom: 17)),
            InstallButtonWidget(),
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

class InstallButtonWidget extends StatelessWidget {
  const InstallButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String installIcon = 'assets/icons/install.svg';

    return SizedBox(
      height: 36.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryW500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: () => {},
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                AppTexts.install,
                style: TextStyle(
                  fontFamily: 'Euclid Circular B',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              installIcon,
              width: 12,
              height: 12,
              color: Colors.white,
              semanticsLabel: 'Install icon',
            ),
          ],
        ),
      ),
    );
  }
}
