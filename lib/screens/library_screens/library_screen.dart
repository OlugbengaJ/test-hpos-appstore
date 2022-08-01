import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/library_screens/library_header_veiw.dart';
import 'package:hpos_appstore/screens/library_screens/library_view.dart';
import 'package:hpos_appstore/screens/screen_config.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static const screenConfig = ScreenConfig(
    '/library',
    child: Text(AppTexts.library,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Numericals.double40,
        right: Numericals.double40,
        bottom: Numericals.double40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LibraryHeaderView(),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          LibraryView(),
        ],
      ),
    );
  }
}
