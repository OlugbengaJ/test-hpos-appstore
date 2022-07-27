import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/screens/library_screens/library_header_veiw.dart';
import 'package:hpos_appstore/screens/library_screens/library_view.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static String route = '/library';

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      content: Column(
        children: const [
          LibraryHeaderView(),
          LibraryView(),
        ],
      ),
    );
  }
}
