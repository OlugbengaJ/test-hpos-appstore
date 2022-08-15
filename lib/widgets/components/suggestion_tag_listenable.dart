import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_horizontal.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack.dart';
import 'package:provider/provider.dart';

class SuggestionTagListenable extends StatelessWidget {
  const SuggestionTagListenable({
    Key? key,
    required this.tag,
    required this.index,
    this.cardType,
  }) : super(key: key);

  /// Identifies the category of the product.
  final String tag;

  /// The layout of the card.
  final CardType? cardType;

  /// Determines what type of card to display when [cardType] is null.
  final int index;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final libraryProvider = Provider.of<LibraryProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: Numericals.double40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: Numericals.double40,
              right: Numericals.double40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top $tag apps',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyW900,
                  ),
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

          // build the products in category
          ValueListenableBuilder<List<Product>>(
            valueListenable: libraryProvider.productsNotifier,
            builder: (context, products, child) => ScrollableStack(
              groupIcons: true,
              border: Border.all(
                color: themeData.primaryColorLight,
                width: 2.0,
              ),
              size: 34,
              children: [
                ...libraryProvider.appsInCategory(tag).map(
                      (product) => Padding(
                        padding: const EdgeInsets.only(
                          right: Numericals.double40,
                        ),
                        child: ListenableProvider(
                          create: (context) =>
                              ProductProvider.fromModel(product),
                          child: _getCardProduct,
                        ),
                      ),
                    )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _getCardProduct {
    bool isVerticalCard;
    if (cardType == null) {
      // get vertical card if index is not multiple of 3.
      isVerticalCard = index % 3 > 0;
    } else {
      // get vertical card based on card type
      isVerticalCard = cardType == CardType.vertical;
    }

    return isVerticalCard
        ? const CardProductVertical()
        : const CardProductHorizontal();
  }
}
