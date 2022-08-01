import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';

class SystemRequirementCard extends StatefulWidget {
  const SystemRequirementCard({Key? key}) : super(key: key);

  @override
  State<SystemRequirementCard> createState() => _SystemRequirementCardState();
}

class _SystemRequirementCardState extends State<SystemRequirementCard> {
  double cardHeight = 76;
  bool showingMore = false;
  void showMore(){
    setState(() {
      cardHeight = 306;
      showingMore = true;
    });
  }

  void showLess(){
    setState(() {
      cardHeight = 76;
      showingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      child: SizedBox(
        height: cardHeight,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: const EdgeInsets.only(left: 36.33),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.green,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 26.33, top: 27, bottom: 26),
                          width: 800,
                          child: const Text(
                            AppTexts.systemRequirementsMessage,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.primaryW900,
                              fontWeight: FontWeight.w500,
                              fontSize: 18
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: showingMore? showLess: showMore,
                  child: Container(
                    margin: const EdgeInsets.only(top: 18, bottom: 18, right: 19),
                    height: 40,
                    width: 137,
                    decoration: BoxDecoration(
                      color: AppColors.primaryW25,
                      borderRadius: BorderRadius.circular(24)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          AppTexts.showMore,
                          style: TextStyle(
                            color: AppColors.primaryW600,
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),
                        ),
                        ImageIcon(
                          AssetImage(
                            AppAssets.chevronDownPng
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            (showingMore)?
            Column(
              children:  [
                const Padding(
                  padding: EdgeInsets.only(left: 34, right: 19),
                  child: Divider(
                    color: AppColors.primaryW100,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 36.33),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.checkSVG,
                        color: AppColors.green,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 19, top: 27/2, bottom: 10),
                        width: 800,
                        child: const Text(
                          "Parturient dolor id nec et bibendum massa semper netus tellus.",
                          overflow: TextOverflow.ellipsis,                          
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 36.33),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.checkSVG,
                        color: AppColors.green,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: const Text(
                          "Feugiat platea aliquam at massa tincidunt ornare. Purus velit neque at proin rhoncus diam in tortor et.",
                          overflow: TextOverflow.ellipsis,                          
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(left: 36.33),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.checkSVG,
                        color: AppColors.green,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: const Text(
                          "Tincidunt tortor lorem lectus facilisis tempus, pulvinar sit adipiscing mauris. Urna pellentesque viverra ac amet aliquam.",
                          overflow: TextOverflow.ellipsis,                          
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(left: 36.33),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.closeSVG,
                        color: AppColors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: const Text(
                          "Neque pellentesque curabitur aenean suspendisse ullamcorper felis. Etiam tincidunt imperdiet elit volutpat eu enim varius mauris.",
                          overflow: TextOverflow.ellipsis,                          
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(left: 36.33),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.closeSVG,
                        color: AppColors.red,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: const Text(
                          "Vel, arcu, interdum massa gravida ultricies.",
                          overflow: TextOverflow.ellipsis,                          
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyW600,
                            fontSize: 14
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}
