import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/colors.dart';

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        height: 400.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppTexts.homeBannerText1),
            Text(AppTexts.homeBannerText2),
            ElevatedButton(
              onPressed: () {},
              child: Ink(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [AppColors.dark, AppColors.primary],
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    AppTexts.discoverMore,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
