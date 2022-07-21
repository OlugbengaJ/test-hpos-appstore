import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/widgets/colors.dart';
import 'package:hpos_appstore/widgets/components/vertical_app_card.dart';

class SuggestionTag extends StatelessWidget {
  const SuggestionTag({Key? key, required this.tag, required this.apps})
      : super(key: key);

  final String tag;
  final List<AppModel> apps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
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
                  style: TextStyle(
                    fontFamily: 'Euclid Circular B',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyW900,
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primaryW600,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontFamily: 'Euclid Circular B',
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
                          child: VerticalAppCard(appData: app),
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
        decoration: ShapeDecoration(
          color: AppColors.primaryW400,
          shape: const CircleBorder(),
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
