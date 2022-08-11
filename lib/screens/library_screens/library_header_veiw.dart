import 'package:flutter/material.dart';
import 'package:hpos_appstore/interactors/interactor_fetch_categories.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/buttons/tag_button.dart';
import 'package:hpos_appstore/widgets/components/scrolls/scrollable_stack.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:provider/provider.dart';

class LibraryHeaderView extends StatelessWidget {
  const LibraryHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var libraryProvider = Provider.of<LibraryProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 25,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: AppColors.primaryW100),
              top: BorderSide(width: 1, color: AppColors.primaryW100),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: (libraryProvider.appView ==
                                      LibraryProducts.all)
                                  ? AppColors.primary
                                  : Colors.transparent,
                              width: 2))),
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text('All Apps',
                      style: TextStyle(
                          fontWeight:
                              (libraryProvider.appView == LibraryProducts.all)
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                          color:
                              (libraryProvider.appView == LibraryProducts.all)
                                  ? AppColors.primary
                                  : AppColors.greyW400)),
                ),
                onTap: () {
                  libraryProvider.setAppView(LibraryProducts.all);
                },
              ),
              const SizedBox(width: 24),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: (libraryProvider.appView ==
                                  LibraryProducts.installed)
                              ? AppColors.primary
                              : Colors.transparent,
                          width: 2),
                    ),
                  ),
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    'Installed Apps',
                    style: TextStyle(
                        color: (libraryProvider.appView ==
                                LibraryProducts.installed)
                            ? AppColors.primary
                            : AppColors.greyW400),
                  ),
                ),
                onTap: () {
                  libraryProvider.setAppView(LibraryProducts.installed);
                },
              ),
            ],
          ),
        ),
        (libraryProvider.appView == LibraryProducts.all)
            ? Column(
                children: [
                  app_spacer.Spacer.bottomLarge,
                  ValueListenableBuilder<List<String>>(
                    valueListenable: libraryProvider.categories,
                    builder: (context, categories, _) {
                      return ScrollableStack(
                        disableIcons: true,
                        children: [
                          ...categories.map(
                            (tag) => ProductTagButton(
                              name: tag,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            : Container(),
        app_spacer.Spacer.bottomMedium,
      ],
    );
  }
}
