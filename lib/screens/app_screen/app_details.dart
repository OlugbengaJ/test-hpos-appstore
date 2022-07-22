import 'package:flutter/material.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';

class AppDetailsView extends StatefulWidget {
  const AppDetailsView({Key? key}) : super(key: key);

  @override
  State<AppDetailsView> createState() => _AppDetailsViewState();
}

class _AppDetailsViewState extends State<AppDetailsView> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      header: Container(),
      content: Container(),
    );
  }
}