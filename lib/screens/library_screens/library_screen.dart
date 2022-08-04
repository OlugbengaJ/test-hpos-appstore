import 'package:flutter/material.dart';
import 'package:hpos_appstore/screens/library_screens/library_header_veiw.dart';
import 'package:hpos_appstore/screens/library_screens/library_view.dart';
import 'package:hpos_appstore/screens/screen_config.dart';
import 'package:hpos_appstore/utils/numericals.dart';
import 'package:hpos_appstore/utils/texts.dart';
import 'package:hpos_appstore/utils/utils_import.dart';
import 'package:hpos_appstore/widgets/components/texts/search_bar_provider.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  static const screenConfig = ScreenConfig(
    '/library',
    child: Text(AppTexts.library,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
  );

  @override
  Widget build(BuildContext context) {
    SearchBarProvider searchProv = Provider.of<SearchBarProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: Numericals.double40,
        right: Numericals.double40,
        bottom: Numericals.double40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // ValueListenableBuilder<bool>(
          //   valueListenable: searchProv.searchNotifier,
          //   builder: (context, value, child) {
          //     return Row(
          //       children: [
          //         (value == true) ? NoContentCard(
          //         title: AppTexts.nocontentTitle,
          //         subtitle: AppTexts.nocontentDescription,
          //         child: Wrap(children: [
          //           SizedBox(
          //             height: 40.0,
          //             width: 130,
          //             child: ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                 elevation: 0.0,
          //                 primary: AppColors.primaryW500,
          //                 shape: const RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.all(
          //                       Radius.circular(Numericals.double8)),
          //                 ),
          //               ),
          //               onPressed: () => {},
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.max,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: const [
          //                   Text(
          //                     AppTexts.goback,
          //                     style: TextStyle(
          //                       fontSize: 14.0,
          //                       fontWeight: FontWeight.w600,
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           const Padding(padding: EdgeInsets.only(left: 10)),
          //           SizedBox(
          //             height: 40.0,
          //             width: 150,
          //             child: ElevatedButton(
          //               style: ElevatedButton.styleFrom(
          //                 elevation: 0.0,
          //                 side: const BorderSide(
          //                   width: 1.0,
          //                   color: AppColors.red,
          //                 ),
          //                 primary: AppColors.white,
          //                 shape: const RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.all(
          //                       Radius.circular(Numericals.double8)),
          //                 ),
          //               ),
          //               onPressed: () => {},
          //               child: Row(
          //                 mainAxisSize: MainAxisSize.max,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: const [
          //                   Padding(
          //                     padding: EdgeInsets.only(right: 10.0),
          //                     child: Text(
          //                       AppTexts.reload,
          //                       style: TextStyle(
          //                         fontSize: 14,
          //                         fontWeight: FontWeight.w600,
          //                         color: AppColors.danger,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           )
          //         ])) :
          LibraryHeaderView(),
          //       ],
          //     );
          //   },
          // ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
          LibraryView(),
        ],
      ),
    );
  }
}
