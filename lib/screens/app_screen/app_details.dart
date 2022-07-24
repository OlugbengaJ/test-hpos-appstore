import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';

class AppDetailsView extends StatelessWidget {
  const AppDetailsView({Key? key}) : super(key: key);

  static String route = '/app_details';

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      header: Container(),
      content: Container(),
    );
  }
}
