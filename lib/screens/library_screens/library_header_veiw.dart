import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/widgets/components/product_card/tag_button.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;
import 'package:provider/provider.dart';

class LibraryHeaderView extends StatelessWidget {
  const LibraryHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                            ))
                      ]),
                  onPressed: () {},
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      primary: Colors.grey,
                      backgroundColor: Colors.transparent),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      fit: StackFit.passthrough,
                      children: [
                        const Positioned(
                            top: 10, child: Text('Installed Apps')),
                        Container(
                          height: 2,
                          margin: const EdgeInsets.only(top: 40.0),
                        )
                      ]),
                  onPressed: () {},
                ),
              ],
            )),
        app_spacer.Spacer.bottomLarge,
        Wrap(
          children: [
            ...Provider.of<LibraryProvider>(context).getTags().map(
                  (e) => ProductTagButton(name: e.name, slug: e.slug),
                )
          ],
        ),
        app_spacer.Spacer.bottomMedium,
      ],
    );
  }
}
