import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:provider/provider.dart';

class ButtonInstall extends StatelessWidget {
  const ButtonInstall({Key? key, this.borderRadius = BorderRadius.zero})
      : super(key: key);

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return SizedBox(
      height: 40.0,
      // width: 256,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryW500,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () => {
          Provider.of<LibraryProvider>(context, listen: false)
              .install(productProvider.productId)
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Text(
                AppTexts.install,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              AppAssets.installSVG,
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
