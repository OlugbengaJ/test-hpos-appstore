import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/product_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/enums.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_horizontal.dart';
import 'package:hpos_appstore/widgets/components/product_card/card_product_vertical.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack.dart';
import 'package:provider/provider.dart';

class SuggestionTag extends StatelessWidget {
  const SuggestionTag({
    Key? key,
    required this.tag,
    required this.products,
    required this.cardType,
  }) : super(key: key);

  final String tag;
  final List<Product> products;
  final CardType cardType;

  @override
  Widget build(BuildContext context) {
    final maxIndex = products.length - 1;

    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag,
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
          ScrollableStack(
            size: 34,
            children: [
              ...products.map(
                (product) {
                  final bool isLast = products.indexOf(product) == maxIndex;

                  return Padding(
                    padding: EdgeInsets.only(right: isLast ? 0.0 : 32.0),
                    child: ListenableProvider(
                      create: (context) => ProductProvider.fromModel(product),
                      child: (cardType == CardType.vertical)
                          ? const CardProductVertical()
                          : const CardProductHorizontal(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
