import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:hpos_appstore/widgets/components/suggestion_tag.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productivityApps = [
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          '48.99',
          3.5,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          3.5,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
          'Google Suite',
          'Productivity',
          'Free',
          5.0,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Microsoft Teams',
          'Productivity',
          'Free',
          4.5,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
          'Google Meet',
          'Productivity',
          '48.99',
          3.5,
          70),
      AppModel(
          'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
          'Zoom',
          'Productivity',
          'Free',
          3.5,
          70),
    ];

    var suggestedProd =
        SuggestedApps(AppTexts.suggestedProductivity, productivityApps);
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(bottom: 54)),
        GridProductDisplay(
            tag: AppTexts.suggestedPaid, apps: suggestedProd.apps),
        ListProductDisplay(
            tag: AppTexts.suggestedPaid, apps: suggestedProd.apps),
      ],
    );
  }
}
