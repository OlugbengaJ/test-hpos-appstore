import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_circle_state.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:provider/provider.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LibraryProvider libraryProvider = Provider.of<LibraryProvider>(context);
    List<Product> apps = libraryProvider.getFilterData('all');

    return ValueListenableBuilder<LibraryDisplay>(
        valueListenable: libraryProvider.selectedView,
        builder: (context, displayType, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonCircleState(
                    pictureAsset: 'assets/icons/grid_icon.svg',
                    listenable: libraryProvider.selectedView,
                    onPressed: () => libraryProvider.selectedView.value =
                        LibraryDisplay.grid,
                    selectionFunction: () =>
                        libraryProvider.selectedView.value ==
                        LibraryDisplay.grid,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 16)),
                  ButtonCircleState(
                    pictureAsset: 'assets/icons/list_icon.svg',
                    logoHeight: 14,
                    listenable: libraryProvider.selectedView,
                    onPressed: () => libraryProvider.selectedView.value =
                        LibraryDisplay.list,
                    selectionFunction: () =>
                        libraryProvider.selectedView.value ==
                        LibraryDisplay.list,
                  ),
                ],
              ),
              app_spacer.Spacer.bottomMedium,
              (displayType == LibraryDisplay.grid)
                  ? GridProductDisplay(apps: apps)
                  : ListProductDisplay(apps: apps),
            ],
          );
        });
  }
}
