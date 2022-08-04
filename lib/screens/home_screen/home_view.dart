import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/utils/enums.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/home_banner.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:hpos_appstore/widgets/components/suggestion_tag.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productivityApps = [
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Microsoft Teams',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 4.5,
        numRatings: 70,
        minAge: 12,
        developer: 'Microsoft Inc',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 254,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
        name: 'Google Meet',
        description: '',
        category: 'Productivity',
        price: '48.99',
        avgRatings: 3.5,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 45,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        name: 'Zoom',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 3.5,
        numRatings: 70,
        minAge: 12,
        developer: 'Zoom.us',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 35,
        ),
      ),
      Product(
        id: BigInt.zero,
        logo: 'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
        name: 'Google Suite',
        description: '',
        category: 'Productivity',
        price: 'Free',
        avgRatings: 5.0,
        numRatings: 70,
        developer: 'Google',
        languages: supportedLanguages,
        applicationInfo: ApplicationInfo(
          updateAvailable: false,
          size: 254,
        ),
      ),
    ];

    var suggestedProd =
        SuggestedApps(AppTexts.suggestedProductivity, productivityApps);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: Numericals.double40,
            right: Numericals.double40,
          ),
          child: HomeBanner(),
        ),
        app_spacer.Spacer.bottomMedium,
        SuggestionTag(
          tag: suggestedProd.tag,
          products: suggestedProd.products,
          cardType: CardType.vertical,
        ),
        app_spacer.Spacer.bottomMedium,
        SuggestionTag(
          tag: AppTexts.suggestedPaid,
          products: suggestedProd.products,
          cardType: CardType.horizontal,
        ),
        app_spacer.Spacer.bottomMedium,
        SuggestionTag(
          tag: AppTexts.suggestedGames,
          products: suggestedProd.products,
          cardType: CardType.vertical,
        ),
        app_spacer.Spacer.bottomMedium,
        SuggestionTag(
          tag: AppTexts.suggestedNew,
          products: suggestedProd.products,
          cardType: CardType.horizontal,
        ),
      ],
    );
  }
}

const supportedLanguages = [
  'AR',
  'FR',
  'DE',
  'JP',
  'ZH',
  'SP',
  'IT',
  'RU',
  'BS',
  'MY',
  'ET',
  'FA',
  'HI',
  'ID',
  'SW',
  'TR'
];