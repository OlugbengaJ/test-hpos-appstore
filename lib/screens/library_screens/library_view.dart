import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/models/product_model.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/product_rows/grid_product_display.dart';
import 'package:hpos_appstore/widgets/components/product_rows/list_product_display.dart';
import 'package:provider/provider.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  LibraryDisplay displayType = LibraryDisplay.grid;

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
            SizedBox(
              width: 40,
              height: 40,
              child: MaterialButton(
                elevation: 0,
                shape: CircleBorder(
                  side: displayType == LibraryDisplay.grid
                      ? const BorderSide(
                    width: 3,
                    color: AppColors.primaryW100,
                    style: BorderStyle.solid,
                  )
                      : BorderSide.none,
                ),
                color: displayType == LibraryDisplay.grid
                    ? AppColors.primary
                    : AppColors.primaryW25,
                onPressed: () {
                  setState(() => displayType = LibraryDisplay.grid);
                },
                child: SvgPicture.asset(
                  'assets/icons/grid_icon.svg',
                  width: 18,
                  height: 18,
                  color: displayType == LibraryDisplay.grid
                      ? AppColors.primaryW25
                      : AppColors.primary,
                  semanticsLabel: 'grid view icon',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(left: 16)),
            SizedBox(
              width: 40,
              height: 40,
              child: MaterialButton(
                elevation: 0,
                shape: CircleBorder(
                  side: displayType == LibraryDisplay.list
                      ? const BorderSide(
                          width: 3,
                          color: AppColors.primaryW100,
                          style: BorderStyle.solid,
                        )
                      : BorderSide.none,
                ),
                color: displayType == LibraryDisplay.list
                    ? AppColors.primary
                    : AppColors.primaryW25,
                textColor: AppColors.primary,
                onPressed: () {
                  setState(() => displayType = LibraryDisplay.list);
                },
                child: SvgPicture.asset(
                  'assets/icons/list_icon.svg',
                  width: 18,
                  height: 14,
                  color: displayType == LibraryDisplay.list
                      ? AppColors.primaryW25
                      : AppColors.primary,
                  semanticsLabel: 'grid view icon',
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
