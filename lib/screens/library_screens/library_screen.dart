import 'package:flutter/widgets.dart';
import 'package:hpos_appstore/widgets/layouts/app_layout.dart';
import 'package:hpos_appstore/widgets/layouts/sidebar_layout.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      right: Container(),
      left: const SidebarLayout(),
    );
  }
}
