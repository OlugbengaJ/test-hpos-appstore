import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/button/button_gradient.dart';
import 'package:hpos_appstore/widgets/components/text/text_gradient.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextGradient(
                text: AppTexts.homeBannerText1,
                textStyle: Theme.of(context).textTheme.headline4?.copyWith(),
                gradient: LinearGradient(
                  colors: [
                    AppColors.greenShader3,
                    AppColors.greenShader1,
                    AppColors.greenShader2,
                  ],
                ),
              ),
              TextGradient(
                text: AppTexts.homeBannerText2,
                textStyle: Theme.of(context).textTheme.headline4?.copyWith(),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.greenShader3,
                    AppColors.greenShader1,
                    AppColors.greenShader2,
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
                      colors: [AppColors.dark, AppColors.orange],
                    ),
                    text: Text(
                      AppTexts.discoverMore,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
