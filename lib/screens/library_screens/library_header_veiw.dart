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
    LibraryProducts view =
        Provider.of<LibraryProvider>(context, listen: false).appView;
    String filterTag =
        Provider.of<LibraryProvider>(context, listen: false).filterTag;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: .2, color: AppColors.greyW900),
                top: BorderSide(width: .2, color: AppColors.greyW900),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(90, 50),
                      primary: Colors.grey,
                      backgroundColor: Colors.transparent),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      fit: StackFit.passthrough,
                      children: [
                        const Positioned(top: 16, child: Text('All Apps')),
                        Container(
                            height: 3,
                            width: 70,
                            margin: const EdgeInsets.only(top: 46),
                            decoration: BoxDecoration(
                              color: (view == LibraryProducts.all)
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ))
                      ]),
                  onPressed: () {
                    libraryProvider.setAppView(LibraryProducts.all);
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(110, 50),
                      primary: Colors.grey,
                      backgroundColor: Colors.transparent),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      fit: StackFit.passthrough,
                      children: [
                        const Positioned(
                            top: 16, child: Text('Installed Apps')),
                        Container(
                            height: 3,
                            width: 100,
                            margin: const EdgeInsets.only(top: 46),
                            decoration: BoxDecoration(
                              color: (view == LibraryProducts.installed)
                                  ? AppColors.primary
                                  : Colors.transparent,
                            ))
                      ]),
                  onPressed: () {
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
