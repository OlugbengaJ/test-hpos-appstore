import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/mappers/product_mapper.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/app_provider/app_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/dialogs/content_dialog.dart';
import 'package:hpos_appstore/widgets/components/product_card/logo_product_rectangle.dart';
import 'package:hpos_appstore/widgets/components/product_card/product_price_tag.dart';
import 'package:hpos_appstore/widgets/components/share_link.dart';
import 'package:hpos_appstore/widgets/modals.dart';
import 'package:provider/provider.dart';

class AppDetailsTopCard extends StatelessWidget {
  const AppDetailsTopCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    final themeData = Theme.of(context);

    return Row(
      children: [
        const LogoProductRectangle(
          borderLength: 184,
          logoWidth: 112,
          logoHeight: 104,
        ),
        Expanded(
          child: Container(
            height: 184,
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Row(
                          children: [
                            SizedBox(
                              child: ValueListenableBuilder<String>(
                                valueListenable: productProvider.nameNotifier,
                                builder: (context, name, _) {
                                  return Text(
                                    name,
                                    style: const TextStyle(
                                        color: AppColors.greyW900,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  );
                                },
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 10)),
                            const ProductPriceTag(),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            SizedBox(
                              child: ValueListenableBuilder<String>(
                                  valueListenable:
                                      productProvider.categoryNotifier,
                                  builder: (context, category, _) {
                                    return Text(
                                      category,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.greyW400),
                                    );
                                  }),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(Icons.circle,
                                  size: 4, color: AppColors.greyW400),
                            ),
                            const SizedBox(
                              child: Text(
                                "App",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyW400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 600,
                      child: const Text(
                        "Make amazing things happen together at home, work and school by connecting and collaborating with anyone from anywhere.",
                        style: TextStyle(
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyW600,
                        ),
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: appProvider.installed,
                  builder: (context, installed, _) {
                    return Row(
                      children: [
                        (!installed)
                            ? Row(
                                children: [
                                  InkWell(
                                    onTap: appProvider.install,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryW500,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 48,
                                      width: 187,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            child: Text(
                                              AppTexts.install,
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: SvgPicture.asset(
                                              AppAssets.installSVG,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              )
                            : Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryW400,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 48,
                                      width: 187,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            child: Text(
                                              AppTexts.installed,
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  InkWell(
                                    onTap: () {
                                      uninstallAppDialog(context, appProvider);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: AppColors.red),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      height: 48,
                                      width: 134,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            child: Text(
                                              AppTexts.uninstall,
                                              style: TextStyle(
                                                  color: AppColors.red,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: SvgPicture.asset(
                                              AppAssets.trashSVG,
                                              color: AppColors.red,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),

                        // share app
                        ButtonRound(
                          onTap: () {
                            ContentDialog.open(
                              context,
                              useRootNavigator: false,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.wifi_tethering,
                                        size: 36.0,
                                        color: AppColors.primary,
                                      ),
                                      const Padding(
                                          padding:
                                              EdgeInsets.only(right: 24.0)),
                                      Text(
                                        AppTexts.shareLink,
                                        style: themeData.textTheme.headline6,
                                      ),
                                    ],
                                  ),
                                  ButtonRound(
                                    icon: Icons.close,
                                    iconColor: themeData.primaryColor,
                                    size: 36.0,
                                    iconSize: 24.0,
                                    onTap: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                              content: ValueListenableBuilder<Product?>(
                                valueListenable:
                                    productProvider.productValueNotifier,
                                builder: (context, product, child) {
                                  return ShareLink(
                                    key: GlobalKey(),
                                    productName: product?.name,
                                    link: ProductMapper.getAppId(product)
                                        ?.getSharingWebUrl(),
                                  ).build(context);
                                },
                              ),
                            );
                          },
                          size: 48.0,
                          iconSize: 24.0,
                          iconColor: AppColors.primaryW400,
                          icon: const ImageIcon(
                            AssetImage(AppAssets.shareIconPng),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
