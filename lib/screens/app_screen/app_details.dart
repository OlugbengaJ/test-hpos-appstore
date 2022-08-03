import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/screens/screen_config.dart';
import 'package:hpos_appstore/utils/styles.dart';
import 'package:hpos_appstore/utils/utils_import.dart';
import 'package:hpos_appstore/widgets/components/app_details_top_card.dart';
import 'package:hpos_appstore/widgets/components/app_info_bar.dart';
import 'package:hpos_appstore/widgets/components/app_review_card.dart';
import 'package:hpos_appstore/widgets/components/app_screenshot.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/dialogs/content_dialog.dart';
import 'package:hpos_appstore/widgets/components/other_informations_card.dart';
import 'package:hpos_appstore/widgets/components/ratings_bar.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack.dart';
import 'package:hpos_appstore/widgets/components/suggestion_tag.dart';
import 'package:hpos_appstore/widgets/components/system_requirement_card.dart';
import 'package:hpos_appstore/widgets/write_review_card.dart';
import 'package:provider/provider.dart';

class AppDetailsView extends StatelessWidget {
  const AppDetailsView({Key? key}) : super(key: key);

  static final screenConfig = ScreenConfig(
    '/app_details',
    showSearch: false,
    child: Row(
      children: [
        ButtonRound(
          icon: Icons.arrow_back,
          iconColor: Theme.of(navigatorKey.currentContext!).primaryColor,
          size: 36.0,
          iconSize: 24.0,
          onTap: () {},
        ),
        const Text(AppTexts.back),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    var productivityApps = [
      Product(
        'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        'Microsoft Teams',
        'Productivity',
        'Free',
        4.5,
        70,
        false,
        241,
        12,
        'Microsoft Inc',
        'EN',
        12,
      ),
      Product(
        'https://upload.wikimedia.org/wikipedia/commons/9/9b/Google_Meet_icon_%282020%29.svg',
        'Google Meet',
        'Productivity',
        '48.99',
        3.5,
        70,
        true,
        45,
        12,
        'Google',
        'EN',
        12,
      ),
      Product(
        'https://upload.wikimedia.org/wikipedia/commons/c/c9/Microsoft_Office_Teams_%282018%E2%80%93present%29.svg',
        'Zoom',
        'Productivity',
        'Free',
        3.5,
        70,
        false,
        47,
        12,
        'Zoom.us',
        'EN',
        12,
      ),
      Product(
        'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
        'Google Suite',
        'Productivity',
        'Free',
        5.0,
        70,
        false,
        235,
        12,
        'Google',
        'EN',
        12,
      )
    ];

    var suggestedProd =
        SuggestedApps(AppTexts.suggestedProductivity, productivityApps);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.only(
            left: Numericals.double40,
            right: Numericals.double40,
          ),
          child: Column(
            children: [
              const AppDetailsTopCard(),
              const Padding(padding: EdgeInsets.only(bottom: 64)),

              const AppInfoBar(),
              const Padding(padding: EdgeInsets.only(bottom: 72)),

              const SectionHeader(title: AppTexts.appScreenshots),
              Container(
                alignment: Alignment.topLeft,
                child: const ScrollableStack(
                  groupIcons: true,
                  size: 40,
                  children: [
                    AppScreenShot(
                      image: "assets/images/screenshot_1.png",
                    ),
                    SizedBox(
                      width: 17,
                    ),
                    AppScreenShot(
                      image: "assets/images/screenshot_2.png",
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 72)),

              const SectionHeader(title: AppTexts.ratingsReviews),
              const RatingReviewCard(),

              const CardWriteReview(),
              const Padding(padding: EdgeInsets.only(top: 56)),

              Container(
                alignment: Alignment.topLeft,
                child: const ScrollableStack(
                  groupIcons: true,
                  size: 40,
                  children: [
                    AppReviewCard(
                      title: 'This app is trash+',
                      content:
                          'Et proin in pellentesque suspendisse nibh lectus mattis ultrices. Lorem arcu pulvinar magna donec posuere massa. Facilisi dapibus mus consectetur ipsum. Odio ut at quam pellentesque faucibus in.',
                      username: 'Draqaris001',
                      date: '14/07/2021',
                      likes: 25,
                      dislikes: 0,
                      stars: 1,
                    ),
                    Padding(padding: EdgeInsets.only(left: 62)),
                    AppReviewCard(
                      title: 'Best app in the world',
                      content:
                          'Et proin in pellentesque suspendisse nibh lectus mattis ultrices. Lorem arcu pulvinar magna donec posuere massa. Facilisi dapibus mus consectetur ipsum. Odio ut at quam pellentesque faucibus in.',
                      username: 'Draqaris001',
                      date: '14/07/2021',
                      likes: 23,
                      dislikes: 0,
                      stars: 1,
                    ),
                  ],
                ),
              ),

              // System requirements
              Container(
                margin: const EdgeInsets.only(top: 72),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: const Text(
                        AppTexts.systemRequirements,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                    const SystemRequirementCard(),
                  ],
                ),
              ),

              // Other information
              Container(
                margin: const EdgeInsets.only(top: 72),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: const Text(
                        AppTexts.otherInformations,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                    const OtherInformationsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 72),
          child: SuggestionTag(
            tag: AppTexts.similarAppSuggestions,
            products: suggestedProd.products,
            cardType: CardType.vertical,
          ),
        ),
      ],
    );
  }
}

void showReview(BuildContext context) {
  ContentDialog.open(context,
      content: WriteReviewScreen(key: GlobalKey()).build(context));
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            TextButton(
              onPressed: () => {},
              child: Container(
                padding: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primaryW600,
                      width: 1.0,
                    ),
                  ),
                ),
                child: const Text(
                  AppTexts.seeAll,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryW600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardWriteReview extends StatelessWidget {
  const CardWriteReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(top: Numericals.double40),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Numericals.double16)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Numericals.double35,
          Numericals.double28,
          Numericals.double35,
          Numericals.double28,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppTexts.clickToRate,
              style: themeData.textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            const Padding(padding: EdgeInsets.only(left: 48)),

            // TODO: Refactor clickable stars here
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_border_outlined,
                    color: AppColors.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_border_outlined,
                    color: AppColors.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_border_outlined,
                    color: AppColors.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.star_border_outlined,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            const Padding(padding: EdgeInsets.only(left: 48)),

            // write review section
            TextButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColors.primaryW25),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.fromLTRB(18.0, 14.0, 18.0, 14.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
              onPressed: () => showReview(context),
              child: Row(
                children: [
                  const ImageIcon(
                    AssetImage(AppAssets.edit),
                    size: 22.0,
                    color: AppColors.primary,
                  ),
                  const Padding(
                    padding:
                    EdgeInsets.only(left: Numericals.double8),
                  ),
                  Text(
                    AppTexts.writeReview,
                    style: themeData.textTheme.bodyText2?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingReviewCard extends StatelessWidget {
  const RatingReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);

    return SizedBox(
      child: Row(
        children: [
          Container(
            height: 184,
            width: 184,
            decoration: BoxDecoration(
                color: AppColors.primaryW600,
                borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder<double>(
                  valueListenable: productProvider.ratingNotifier,
                  builder: (context, rating, _) {
                    return Text(
                      rating.toString(),
                      style: AppStyles.cardLarge,
                    );
                  },
                ),
                ValueListenableBuilder<int>(
                  valueListenable: productProvider.reviewerCountNotifier,
                  builder: (context, count, _) {
                    return Text(
                      '$count Ratings',
                      style: AppStyles.cardMedium,
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 56),
            height: 184,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                RatingsBar(star: 5, percent: 0.5),
                RatingsBar(star: 4, percent: 0.9),
                RatingsBar(star: 3, percent: 0.2),
                RatingsBar(star: 2, percent: 0.4),
                RatingsBar(star: 1, percent: 0.1),
              ],
            ),
          )
        ],
      ),
    );
  }
}