import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hpos_appstore/providers/library_providers/library_provider.dart';
import 'package:hpos_appstore/widgets/themes.dart';
import 'package:provider/provider.dart';

class ProductTagButton extends StatelessWidget {
  const ProductTagButton(
      {Key? key, required this.id, required this.name, required this.slug})
      : super(key: key);
  final String name;
  final String slug;
  final int id;

  @override
  Widget build(BuildContext context) {
    LibraryProvider libraryProvider =
        Provider.of<LibraryProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: TextButton(
        onPressed: () {
          libraryProvider.setFilterTag(slug);
        },
        style: (libraryProvider.filterTag == slug)
            ? filterBtnPrimary
            : filterBtnWhite,
        child: Wrap(
          children: [
            InkWell(
              onTap: () {
                libraryProvider.removeFilterTag(id);
              },
              child: Icon(Icons.close,
                  size: (libraryProvider.filterTag == slug) ? 15 : 0),
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
            Text(
              name,
            ),
            const Padding(padding: EdgeInsets.only(left: 15)),
          ],
        ),
      ),
    );
  }
}
