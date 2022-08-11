import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/styles.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/app_info_card.dart';
import 'package:provider/provider.dart';


class AppInfoBar extends StatelessWidget {
  const AppInfoBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    const cardDivider = VerticalDivider(
      color: AppColors.greyW600,
      width: 2,
      thickness: 2,
    );

    return Container(
      height: 132,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientGreyW500,
          stops: [0.25, 71, 96],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppInfoCard(
            top: AppTexts.rating,
            center: ValueListenableBuilder<double>(
              valueListenable: productProvider.ratingNotifier,
              builder: (context, rating, _) {
                return Text(
                  '$rating',
                  style: AppStyles.appInfoCardStyle,
                );
              },
            ),
            bottom: AppTexts.average,
          ),
          cardDivider,
          AppInfoCard(
            top: AppTexts.size,
            center: ValueListenableBuilder<int>(
              valueListenable: productProvider.sizeNotifier,
              builder: (context, size, _) {
                return Text(
                  '$size',
                  style: AppStyles.appInfoCardStyle,
                );
              },
            ),
            bottom: AppTexts.sizeUnitMB,
          ),
          cardDivider,
          AppInfoCard(
            top: AppTexts.age,
            center: ValueListenableBuilder<int>(
              valueListenable: productProvider.minAgeNotifier,
              builder: (context, minAge, _) {
                return Text(
                  '$minAge +',
                  style: AppStyles.appInfoCardStyle,
                );
              },
            ),
            bottom: AppTexts.years,
          ),
          cardDivider,
          ValueListenableBuilder<String>(
              valueListenable: productProvider.developerNotifier,
              builder: (context, developer, _) {
                return AppInfoCard(
                  top: AppTexts.developer,
                  center: const ImageIcon(
                    AssetImage(AppAssets.terminalSquarePng),
                    size: 40,
                    color: AppColors.greyW100,
                  ),
                  bottom: developer,
                );
              }),
          cardDivider,
          ValueListenableBuilder<List<String>>(
            valueListenable: productProvider.supportedLanguagesNotifier,
            builder: (context, supportedLanguages, _) {
              return AppInfoCard(
                top: AppTexts.language,
                center: ValueListenableBuilder<String>(
                  valueListenable: productProvider.languageNotifier,
                  builder: (context, language, _) {
                    return Text(
                      language,
                      style: AppStyles.appInfoCardStyle,
                    );
                  },
                ),
                bottom: '+ ${supportedLanguages.length - 1} More',
              );
            },
          ),
          cardDivider,
          AppInfoCard(
            top: AppTexts.parentalGuidance,
            center: ValueListenableBuilder<int>(
                valueListenable:
                productProvider.parentalGuidanceAgeNotifier,
                builder: (context, age, _) {
                  return Text(
                    "$age +",
                    style: AppStyles.appInfoCardStyle,
                  );
                }),
            bottom: AppTexts.recommended,
          ),
        ],
      ),
    );
  }
}