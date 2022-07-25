import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_horizontal.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:provider/provider.dart';

class SuggestionTag extends StatelessWidget {
  const SuggestionTag(
      {Key? key, required this.tag, required this.apps, required this.cardType})
      : super(key: key);

  final String tag;
  final List<AppModel> apps;
  final String cardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyW900,
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primaryW600,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      AppTexts.seeAll,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryW600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...apps
                    .map((app) => Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: ListenableProvider(
                                  create: (context) =>
                                      ProductProvider.fromModel(app),
                                  child: (cardType == 'vertical')
                                      ? const CardProductVertical()
                                      : const CardProductHorizontal(),
                                ),
                        ))
                    .toList(),
                const Padding(
                  padding: EdgeInsets.all(41.0),
                  child: ArrowForwardWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ArrowForwardWidget extends StatelessWidget {
  const ArrowForwardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const arrowAsset = 'assets/icons/arrow_forward.svg';
    return Material(
      child: Ink(
        width: 40.0,
        height: 40.0,
        decoration: const ShapeDecoration(
          color: AppColors.primaryW400,
          shape: CircleBorder(),
        ),
        child: IconButton(
          splashRadius: 25.0,
          splashColor: AppColors.primaryW100,
          onPressed: () => {},
          icon: SvgPicture.asset(
            arrowAsset,
            width: 14.0,
            height: 14.0,
            color: Colors.white,
            semanticsLabel: 'Arrow forward icon',
          ),
        ),
      ),
    );
  }
}
