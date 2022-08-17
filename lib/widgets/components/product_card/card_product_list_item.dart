import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/product_card/button_update_delete.dart';
import 'package:hpos_appstore/widgets/components/product_card/column_product_info.dart';
import 'package:hpos_appstore/widgets/components/product_card/logo_product_rectangle.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_card_navigation.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_price_tag.dart';
import 'package:hpos_appstore/widgets/components/product_card/rating_view.dart';
import 'package:provider/provider.dart';

import 'button_install.dart';

class CardProductListItem extends StatelessWidget {
  const CardProductListItem({Key? key, this.hasUpdate = false})
      : super(key: key);

  final bool? hasUpdate;

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return ProductCardNavigation(
      child: Card(
        child: Container(
          height: 96,
          padding:
              const EdgeInsets.only(left: 14, top: 13, right: 30, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: const [
                    LogoProductRectangle(
                      borderLength: 71,
                      logoWidth: 35,
                      logoHeight: 35,
                    ),
                    Padding(padding: EdgeInsets.only(left: 39)),
                    ColumnProductInfo(headerOnly: true),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ValueListenableBuilder<InstallationStatus>(
                    valueListenable: productProvider.installationStatus,
                    builder: (context, status, _) {
                      return Row(
                        mainAxisAlignment:
                            status == InstallationStatus.installed
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.spaceAround,
                        children: const [
                          ProductPriceTag(),
                          SizedBox(width: 100, child: RatingView()),
                          ButtonShare(),
                        ],
                      );
                    }),
              ),
              ValueListenableBuilder<InstallationStatus>(
                  valueListenable: productProvider.installationStatus,
                  builder: (context, status, _) {
                    return Expanded(
                      flex: (status == InstallationStatus.installed) ? 2 : 1,
                      child: (status == InstallationStatus.installed)
                          ? ButtonUpdateDelete(
                              hasUpdate: hasUpdate,
                              onDelete: () {},
                              onUpdate: () {},
                            )
                          : const ButtonInstall(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                    );
                  }),
            ],
          ),
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
