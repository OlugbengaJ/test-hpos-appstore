import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/assets.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_gradient.dart';
import 'package:hpos_appstore/widgets/components/texts/text_gradient.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            AppColors.greyW600,
            AppColors.greyW1000,
          ],
        ),
        borderRadius: BorderRadius.circular(Numericals.double16),
        image: DecorationImage(
          image: Image.asset(AppAssets.bannerAppsPng).image,
          alignment: const Alignment(0.8, 1.0),
        ),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(55.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextGradient(
                text: AppTexts.homeBannerText1,
                textStyle: themeData.textTheme.headline5
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 40.0),
                gradient: const RadialGradient(
                  radius: 10,
                  colors: [
                    AppColors.greenShader1,
                    AppColors.greenShader2,
                    AppColors.secondary,
                  ],
                ),
              ),
              TextGradient(
                text: AppTexts.homeBannerText2,
                textStyle: themeData.textTheme.headline5
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 40.0),
                gradient: const RadialGradient(
                  radius: 10,
                  colors: [
                    // AppColors.greenShader1,
                    AppColors.greenShader2,
                    AppColors.secondary,
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  ButtonGradient(
                    radius: 4.0,
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryW500,
                        AppColors.primaryW400,
                      ],
                    ),
                    text: Text(
                      AppTexts.discoverMore,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
