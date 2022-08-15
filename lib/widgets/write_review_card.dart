import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hpos_appstore/utils/constraints.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_rect.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/texts/textfield_box.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({
    Key? key,
    required this.productName,
  }) : super(key: key);

  final String productName;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      margin: EdgeInsets.zero,
      constraints: BoxConstraints(
        maxWidth: AppConstraint.window.physicalSize.width * 0.24,
        maxHeight: AppConstraint.window.physicalSize.height * 0.8,
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(Numericals.double16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${AppTexts.review} $productName',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: themeData.textTheme.headline6,
                        ),
                        ButtonRound(
                          icon: Icons.close,
                          iconColor: themeData.primaryColor,
                          size: 36.0,
                          iconSize: 24.0,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: Numericals.double28),
                    child: RatingBar.builder(
                      initialRating: 5,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemSize: Numericals.double40,
                      itemCount: 5,
                      updateOnDrag: true,
                      onRatingUpdate: (rating) {},
                      itemBuilder: (context, _) {
                        return const Icon(Icons.star_border,
                            color: AppColors.primary);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      AppTexts.reviewTitle,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: themeData.textTheme.labelLarge,
                    ),
                  ),
                  TextFieldBox(
                    textController: TextEditingController(),
                    hintText: AppTexts.reviewTitleHint,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      AppTexts.reviewDescription,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: themeData.textTheme.labelLarge,
                    ),
                  ),
                  TextFieldBox(
                    textController: TextEditingController(),
                    hintText: AppTexts.reviewDescriptionHint,
                    maxLines: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppTexts.reviewTerms,
                            style: themeData.textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: ' ${AppTexts.termsOfSale}',
                            style: themeData.textTheme.bodySmall
                                ?.copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: ButtonRect(
                          tapHandler: () => Navigator.pop(context),
                          color: AppColors.primary,
                          radius: BorderRadius.circular(8.0),
                          child: const Text(
                            AppTexts.submit,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      // creates a space between buttons
                      const SizedBox(width: 8.0),

                      // cancel button
                      Flexible(
                        fit: FlexFit.tight,
                        child: ButtonRect(
                          tapHandler: () => Navigator.pop(context),
                          radius: BorderRadius.circular(8.0),
                          child: const Text(
                            AppTexts.cancel,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
