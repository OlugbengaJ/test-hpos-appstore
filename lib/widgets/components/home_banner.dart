import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/constants.dart';
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            AppColors.greyW600,
            AppColors.greyW1000,
          ],
        ),
        borderRadius: BorderRadius.circular(Constants.radius16),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextGradient(
                text: AppTexts.homeBannerText1,
                textStyle: themeData.textTheme.headline4
                    ?.copyWith(fontWeight: FontWeight.w700),
                gradient: RadialGradient(
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
                textStyle: themeData.textTheme.headline4
                    ?.copyWith(fontWeight: FontWeight.w700),
                gradient: RadialGradient(
                  radius: 10,
                  colors: [
                    // AppColors.greenShader1,
                    AppColors.greenShader2,
                    AppColors.secondary,
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonGradient(
                    radius: 4.0,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryW500, AppColors.primaryW400],
                    ),
                    text: Text(
                      AppTexts.discoverMore,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
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
