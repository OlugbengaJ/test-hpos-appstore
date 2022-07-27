import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/utils/enums.dart';
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
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          '48.99',
          3.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          3.5,
          70),
      Product(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          5.0,
          70),
    ];

    var suggestedProd =
        SuggestedApps(AppTexts.suggestedProductivity, productivityApps);

    return Column(
      children: [
        const HomeBanner(),
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
        const Padding(padding: EdgeInsets.only(bottom: 54)),
        SuggestionTag(
          tag: AppTexts.suggestedGames,
          products: suggestedProd.products,
          cardType: CardType.vertical,
        ),
        const Padding(padding: EdgeInsets.only(bottom: 54)),
        SuggestionTag(
          tag: AppTexts.suggestedNew,
          products: suggestedProd.products,
          cardType: CardType.horizontal,
        ),
      ],
    );
  }
}
