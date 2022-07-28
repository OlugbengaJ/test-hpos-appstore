import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:provider/provider.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryView extends StatelessWidget {
  const LibraryView({Key? key}) : super(key: key);
  final LibraryDisplay displayType = LibraryDisplay.grid;

  @override
  Widget build(BuildContext context) {
    List<Product> apps =
        Provider.of<LibraryProvider>(context).getFilterData('all');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaterialButton(
              shape: const CircleBorder(
                  side: BorderSide(
                      width: 1,
                      color: AppColors.primary,
                      style: BorderStyle.solid)),
              color: AppColors.white,
              textColor: AppColors.primary,
              onPressed: () {
                // displayType = LibraryDisplay.grid;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.grid_3x3_sharp, color: AppColors.primary),
                  ],
                ),
              ),
            ),
            MaterialButton(
              shape: const CircleBorder(
                  side: BorderSide(
                      width: 1,
                      color: AppColors.primary,
                      style: BorderStyle.solid)),
              color: AppColors.white,
              textColor: AppColors.primary,
              onPressed: () {
                // displayType = LibraryDisplay.list;
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.list_alt_outlined, color: AppColors.primary),
                  ],
                ),
              ),
            ),
          ],
        ),
        app_spacer.Spacer.bottomMedium,
        (displayType == LibraryDisplay.grid)
            ? GridProductDisplay(apps: apps)
            : ListProductDisplay(apps: apps),
      ],
    );
  }
}
