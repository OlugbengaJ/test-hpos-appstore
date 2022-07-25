import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/product_card/column_product_info.dart';
import 'package:hpos_appstore/widgets/components/product_card/logo_product_rectangle.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_price_tag.dart';
import 'package:hpos_appstore/widgets/components/product_card/rating_view.dart';

import '../../../utils/texts.dart';

class CardProductListItem extends StatelessWidget {
  const CardProductListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      color: const Color(0xfffcfcfd),
      child: Container(
        width: 1289,
        height: 96,
        padding:
            const EdgeInsets.only(left: 14, top: 13, right: 30, bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            LogoProductRectangle(
              borderLength: 71,
              logoWidth: 35,
              logoHeight: 32,
            ),
            Padding(padding: EdgeInsets.only(left: 39)),
            ColumnProductInfo(headerOnly: true),
            Padding(padding: EdgeInsets.only(left: 124)),
            ProductPriceTag(),
            Padding(padding: EdgeInsets.only(left: 134)),
            RatingView(),
            Padding(padding: EdgeInsets.only(left: 127)),
            ButtonShare(),
            Padding(padding: EdgeInsets.only(left: 102)),
            ButtonInstall(),
          ],
        ),
      ),
    );
  }
}

class ButtonShare extends StatelessWidget {
  const ButtonShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Image(
            image: AssetImage('assets/icons/share_icon.png'),
          ),
          Padding(padding: EdgeInsets.only(left: 11)),
          Text(
            AppTexts.share,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryW500),
          )
        ],
      ),
    );
  }
}

class ButtonInstall extends StatelessWidget {
  const ButtonInstall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      width: 256,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryW500,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/install.svg',
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
