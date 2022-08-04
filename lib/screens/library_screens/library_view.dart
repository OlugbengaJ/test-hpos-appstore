import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/buttons/button_circle_state.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:provider/provider.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LibraryProvider libraryProvider = Provider.of<LibraryProvider>(context);
    LibraryProducts appView = libraryProvider.appView;
    List<Product> apps = libraryProvider.getFilterData('all');

    return ValueListenableBuilder(
        valueListenable: libraryProvider.displayType,
        builder: (context, displayType, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonCircleState(
                    pictureAsset: 'assets/icons/grid_icon.svg',
                    listenable: libraryProvider.displayType,
                    onPressed: () =>
                        libraryProvider.displayType.value = LibraryDisplay.grid,
                    selectionFunction: () =>
                        libraryProvider.displayType.value ==
                        LibraryDisplay.grid,
                  ),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  ButtonCircleState(
                    pictureAsset: 'assets/icons/list_icon.svg',
                    logoHeight: 14,
                    listenable: libraryProvider.displayType,
                    onPressed: () =>
                        libraryProvider.displayType.value = LibraryDisplay.list,
                    selectionFunction: () =>
                        libraryProvider.displayType.value ==
                        LibraryDisplay.list,
                  ),
                  const Spacer(),
                  (appView == LibraryProducts.all)
                      ? Container()
                      : SizedBox(
                          height: 48.0,
                          width: 195,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.primaryW500,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Numericals.double8)),
                              ),
                            ),
                            onPressed: () => {},
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    AppTexts.updateAll,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 38)),
              (displayType == LibraryDisplay.grid)
                  ? GridProductDisplay(
                      apps: apps,
                      isInstalled:
                          (appView == LibraryProducts.installed) ? true : false)
                  : ListProductDisplay(
                      apps: apps,
                      isInstalled:
                          (appView == LibraryProducts.installed) ? true : false)
            ],
          );
        });
// >>>>>>> Stashed changes
  }
}
