import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/utils/languages.dart';
import 'package:hpos_appstore/wrappers/DeviceConfigWrapper.dart';
import 'package:provider/provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';

class SystemRequirementCard extends StatefulWidget {
  const SystemRequirementCard({Key? key}) : super(key: key);

  @override
  State<SystemRequirementCard> createState() => _SystemRequirementCardState();
}

class _SystemRequirementCardState extends State<SystemRequirementCard> {

  Product product = Product(
    id: BigInt.two,
    logo:
    'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
    name: 'Google Suite',
    description: '',
    category: 'Productivity',
    price: 'Free',
    avgRatings: 5.0,
    numRatings: 70,
    minAge: 12,
    developer: 'Google',
    languages: Languages.locales,
    applicationInfo: ApplicationInfo(
        updateAvailable: false,
        size: 255,
        appRequirements: ApplicationRequirements(
          requiredOSVersion: '3.5.0',
          requiredRam: BigInt.from(10000),
          requiredDisk: BigInt.from(10000),
          requiredBandwidth: BigInt.from(10000),
          requiredProcessorMHz: BigInt.from(10),
        )),
  );

  double cardHeight = 76;
  bool showingMore = false;

  void showMore() {
    setState(() {
      cardHeight = 306;
      showingMore = true;
    });
  }

  void showLess() {
    setState(() {
      cardHeight = 76;
      showingMore = false;
    });
  }

  bool operatingSystemMatches(DeviceConfigWrapper deviceConfig) {
    return deviceConfig.osVersion ==
        product.applicationInfo?.appRequirements?.requiredOSVersion;
  }

  bool memoryMatches(DeviceConfigWrapper deviceConfig) {
    return deviceConfig.systemMem ==
        product.applicationInfo?.appRequirements?.requiredRam?.toInt();
  }

  Future<bool> diskSpaceMatches(DeviceConfigWrapper deviceConfig) async {
    return await deviceConfig.systemDisk ==
        product.applicationInfo?.appRequirements?.requiredDisk?.toInt();
  }

  bool processorMatches(DeviceConfigWrapper deviceConfig) {
    return deviceConfig.systemBandwidth ==
        product.applicationInfo?.appRequirements?.requiredBandwidth?.toDouble();
  }

  bool screenDimensionMatches(DeviceConfigWrapper deviceConfig) {
    return deviceConfig.screenDimension ==
        product.applicationInfo?.appRequirements?.requiredProcessorMHz;
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfigWrapper? deviceConfig = DeviceConfigWrapper(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return PhysicalModel(
      color: AppColors.greyW25,
      borderRadius: BorderRadius.circular(16),
      elevation: 0.5,
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
                          margin: const EdgeInsets.only(
                              left: 26.33, top: 27, bottom: 26),
                          width: 800,
                          child: const Text(
                            AppTexts.systemRequirementsMessage,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.primaryW900,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: showingMore ? showLess : showMore,
                  child: Container(
                    margin:
                    const EdgeInsets.only(top: 18, bottom: 18, right: 19),
                    height: 40,
                    width: 137,
                    decoration: BoxDecoration(
                        color: AppColors.primaryW25,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          showingMore ? AppTexts.showLess : AppTexts.showMore,
                          style: const TextStyle(
                              color: AppColors.primaryW600,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        SvgPicture.asset(
                          showingMore
                              ? AppAssets.chervronUpSVG
                              : AppAssets.chervronDownSVG,
                          color: AppColors.primaryW600,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            (showingMore)
                ? Column(
              children: [
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
                        margin: const EdgeInsets.only(
                            left: 19, top: 27 / 2, bottom: 10),
                        width: 800,
                        child: Text(
                          '${AppTexts.systemRequirementsOsVersion} '
                              '${product.applicationInfo?.appRequirements?.requiredOSVersion}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyW600,
                              fontSize: 14),
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
                        margin: const EdgeInsets.only(
                            left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: Text(
                          '${AppTexts.systemRequirementsMemory} '
                              '${product.applicationInfo?.appRequirements?.requiredRam}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyW600,
                              fontSize: 14),
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
                        margin: const EdgeInsets.only(
                            left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: Text(
                          '${AppTexts.systemRequirementsDisk} '
                              '${product.applicationInfo?.appRequirements?.requiredDisk}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyW600,
                              fontSize: 14),
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
                        margin: const EdgeInsets.only(
                            left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: Text(
                          '${AppTexts.systemRequirementsProcessor} '
                              '${product.applicationInfo?.appRequirements?.requiredProcessorMHz}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyW600,
                              fontSize: 14),
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
                        margin: const EdgeInsets.only(
                            left: 19, top: 10, bottom: 10),
                        width: 800,
                        child: Text(
                          '${AppTexts.systemRequirementsScreenDimension} '
                              '${product.applicationInfo?.appRequirements?.requiredBandwidth}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyW600,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}