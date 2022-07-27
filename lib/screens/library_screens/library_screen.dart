import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/screens/library_screens/library_header_veiw.dart';
import 'package:hpos_appstore/screens/library_screens/library_view.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static String route = '/library';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        app_spacer.Spacer.bottomMedium,
        const LibraryHeaderView(),
        app_spacer.Spacer.bottomMedium,
        const LibraryView(),
      ],
    );
  }
}
