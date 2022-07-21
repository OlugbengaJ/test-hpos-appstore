import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_model.dart';
import 'package:hpos_appstore/widgets/components/suggestion_tag.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productivityApps = [
      AppModel(
          "https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg",
          "Microsoft Teams",
          "Productivity",
          "Free",
          4.5,
          70),
      AppModel(
          "https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg",
          "Google Meet",
          "Productivity",
          "Free",
          4.5,
          70),
      AppModel(
          "https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg",
          "Zoom",
          "Productivity",
          "Free",
          4.5,
          70),
      AppModel(
          "https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg",
          "Google Suite",
          "Productivity",
          "Free",
          4.5,
          70)
    ];

    var suggestedProd =
        SuggestedApps("Top Productivity apps", productivityApps);

    return SuggestionTag(tag: suggestedProd.tag, apps: suggestedProd.apps);
  }
}
