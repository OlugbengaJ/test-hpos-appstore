import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';

class HeaderLayout extends StatelessWidget {
  const HeaderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }
}
