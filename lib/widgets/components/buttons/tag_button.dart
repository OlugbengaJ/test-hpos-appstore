import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/widgets/themes.dart';
import 'package:provider/provider.dart';

class ProductTagButton extends StatelessWidget {
  const ProductTagButton({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    LibraryProvider libraryProvider =
        Provider.of<LibraryProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {
          libraryProvider.filterTag = name;
        },
        style: (libraryProvider.filterTag == name)
            ? filterBtnPrimary
            : filterBtnWhite,
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: InkWell(
                onTap: () {
                  libraryProvider.removeFilterTag(name);
                },
                child: Icon(
                  Icons.close,
                  size: (libraryProvider.filterTag == name) ? 15 : 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
