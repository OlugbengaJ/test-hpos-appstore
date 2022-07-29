import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';

ButtonStyle textBtnStyleWhite = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    )));

ThemeData appTheme = ThemeData(
  fontFamily: 'EuclidCircularB',
  primaryColor: AppColors.primaryW400,
  primaryColorLight: AppColors.primaryW25,
  primaryColorDark: AppColors.primaryW600,

// general theme for inputs e.g. text field
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.zero,
    iconColor: AppColors.primaryW400,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryW100),
      borderRadius: BorderRadius.circular(Numericals.double8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.primaryW400),
      borderRadius: BorderRadius.circular(Numericals.double8),
    ),
  ),
  cardTheme: CardTheme(
    color: AppColors.greyW25,
    shadowColor: AppColors.shadow.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Numericals.double16),
      ),
    ),
  ),
);
