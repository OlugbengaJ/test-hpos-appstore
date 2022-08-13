import 'package:flutter/material.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_applications.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/utilities.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_horizontal.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack.dart';
import 'package:provider/provider.dart';

/// A stateful widget used to render a product suggestion section.
class SuggestionTagState extends StatefulWidget {
  const SuggestionTagState({
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
  State<SuggestionTagState> createState() => _SuggestionTagStateState();
}

class _SuggestionTagStateState extends State<SuggestionTagState> {
  late Future<List<Product>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _getProduct();
  }

  Future<List<Product>> _getProduct() async {
    return await InteractorFetchApps.appsInCategory(widget.tag);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

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
                  'Top ${widget.tag} apps',
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
          FutureBuilder<List<Product>>(
            future: _productFuture,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text(':(');
                case ConnectionState.waiting:
                  return const LinearProgressIndicator();
                case ConnectionState.done:
                  // products returned
                  final products = snapshot.data!;

                  return ScrollableStack(
                    groupIcons: true,
                    border: Border.all(
                      color: themeData.primaryColorLight,
                      width: 2.0,
                    ),
                    size: 34,
                    children: [
                      ...products.map(
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
                  );
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget get _getCardProduct {
    bool isVerticalCard;
    if (widget.cardType == null) {
      // get vertical card if index is not multiple of 3.
      isVerticalCard = widget.index % 3 > 0;
    } else {
      // get vertical card based on card type
      isVerticalCard = widget.cardType == CardType.vertical;
    }

    return isVerticalCard
        ? const CardProductVertical()
        : const CardProductHorizontal();
  }
}
