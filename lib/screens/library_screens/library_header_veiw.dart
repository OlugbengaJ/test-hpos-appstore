import 'package:flutter/material.dart';
import 'package:hpos_appstore/models/app_enum.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/buttons/tag_button.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:provider/provider.dart';

class LibraryHeaderView extends StatelessWidget {
  const LibraryHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LibraryProvider libraryProvider =
        Provider.of<LibraryProvider>(context, listen: false);

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
                          fontWeight: (libraryProvider.appView ==
                                    LibraryProducts.all)
                                ?FontWeight.w500:FontWeight.w400,
                            color: (libraryProvider.appView ==
                                    LibraryProducts.all)
                                ? AppColors.primary
                                : AppColors.greyW400)),
                  ),
                  // child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text('All Apps'),
                  //       const Padding(padding: EdgeInsets.only(bottom: 25)),
                  //       Container(
                  //           height: 2,
                  //           width: 70,
                  //           decoration: BoxDecoration(
                  //             color: (libraryProvider.appView ==
                  //                     LibraryProducts.all)
                  //                 ? AppColors.primary
                  //                 : Colors.transparent,
                  //           ))
                  //     ]),
                  onTap: () {
                    libraryProvider.setAppView(LibraryProducts.all);
                  },
                ),
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: (libraryProvider.appView ==
                                        LibraryProducts.installed)
                                    ? AppColors.primary
                                    : Colors.transparent,
                                width: 2))),
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
                  // child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text('Installed Apps'),
                  //       const Padding(padding: EdgeInsets.only(bottom: 15)),
                  //       Container(
                  //           height: 2,
                  //           width: 100,
                  //           decoration: BoxDecoration(
                  //             color: (libraryProvider.appView ==
                  //                     LibraryProducts.installed)
                  //                 ? AppColors.primary
                  //                 : Colors.transparent,
                  //           ))
                  //     ]),
                  onTap: () {
                    libraryProvider.setAppView(LibraryProducts.installed);
                  },
                ),
              ],
            )),
        (libraryProvider.appView == LibraryProducts.all)
            ? Column(
                children: [
                  app_spacer.Spacer.bottomLarge,
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      ...Provider.of<LibraryProvider>(context).getTags().map(
                            (e) => ProductTagButton(
                                id: e.id, name: e.name, slug: e.slug),
                          )
                    ],
                  ),
                ],
              )
            : Container(),
        app_spacer.Spacer.bottomMedium,
      ],
    );
  }
}
