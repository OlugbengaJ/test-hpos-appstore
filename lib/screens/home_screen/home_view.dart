import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/widgets/components/home_banner.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:hpos_appstore/widgets/components/suggestion_tag_state.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final libraryProvider = Provider.of<LibraryProvider>(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: Numericals.double40,
            right: Numericals.double40,
          ),
          child: HomeBanner(),
        ),

        // list the categories from the app store sdk
        ValueListenableBuilder<List<String>>(
          valueListenable: libraryProvider.homeCategories,
          builder: (context, value, child) {
            return Column(
              children: [
                // create sections with products
                ...value.map(
                  (tag) => Column(children: [
                    app_spacer.Spacer.bottomMedium,
                    getSuggestionCategory(tag, context),
                  ]),
                ),
              ],
            );
          },
        ),
        app_spacer.Spacer.bottomLarge,
      ],
    );
  }

  Widget getSuggestionCategory(String tag, BuildContext context) {
    return SuggestionTagState(
      tag: tag,
      index: ++count,
    );
  }
}

int count = 0;
