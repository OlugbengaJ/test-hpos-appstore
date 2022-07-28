import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/library_screens/library_header_veiw.dart';
import 'package:hpos_appstore/screens/library_screens/library_view.dart';
import 'package:hpos_appstore/screens/screen_config.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/widgets/components/spacer.dart' as app_spacer;

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static const screenConfig = ScreenConfig(
    '/library',
    child: Text(AppTexts.library,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          app_spacer.Spacer.bottomMedium,
          const LibraryHeaderView(),
          app_spacer.Spacer.bottomMedium,
          const LibraryView(),
        ],
      ),
    );
  }
}
