import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_round.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:provider/provider.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> apps =
        Provider.of<LibraryProvider>(context).getFilterData('all');
    var display =
        Provider.of<LibraryProvider>(context, listen: false).displayType;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ButtonRound(
              icon: Icons.apps,
              color: (display == LibraryDisplay.grid)
                  ? AppColors.primary
                  : AppColors.white,
              iconColor: (display == LibraryDisplay.grid)
                  ? AppColors.white
                  : AppColors.primary,
              size: 40,
              iconSize: 25,
              onTap: () {
                Provider.of<LibraryProvider>(context, listen: false)
                    .setDisplayView(LibraryDisplay.grid);
              },
            ),
            const Padding(padding: EdgeInsets.only(left: 20)),
            ButtonRound(
              icon: Icons.list_alt_outlined,
              color: (display == LibraryDisplay.list)
                  ? AppColors.primary
                  : AppColors.white,
              iconColor: (display == LibraryDisplay.list)
                  ? AppColors.white
                  : AppColors.primary,
              size: 40,
              iconSize: 25,
              onTap: () {
                Provider.of<LibraryProvider>(context, listen: false)
                    .setDisplayView(LibraryDisplay.list);
              },
            ),
          ],
        ),
        app_spacer.Spacer.bottomMedium,
        Wrap(children: [
          (Provider.of<LibraryProvider>(context, listen: false).displayType ==
                  LibraryDisplay.grid)
              ? GridProductDisplay(apps: apps)
              : ListProductDisplay(apps: apps)
        ]),
      ],
    );
  }
}
