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
    LibraryProvider libraryProvider =
        Provider.of<LibraryProvider>(context, listen: false);
    List<Product> apps =
        Provider.of<LibraryProvider>(context).getFilterData('all');
    LibraryDisplay display =
        Provider.of<LibraryProvider>(context, listen: false).displayType;
    LibraryProducts appView =
        Provider.of<LibraryProvider>(context, listen: false).appView;

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
                libraryProvider.setDisplayView(LibraryDisplay.grid);
              },
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
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
                libraryProvider.setDisplayView(LibraryDisplay.list);
              },
            ),
          ],
        ),
        app_spacer.Spacer.bottomMedium,
        Wrap(children: [
          (display == LibraryDisplay.grid)
              ? GridProductDisplay(
                  apps: apps,
                  isInstalled:
                      (appView == LibraryProducts.installed) ? true : false)
              : ListProductDisplay(
                  apps: apps,
                  isInstalled:
                      (appView == LibraryProducts.installed) ? true : false)
        ]),
      ],
    );
  }
}
