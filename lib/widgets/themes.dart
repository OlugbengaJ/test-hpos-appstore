import 'package:flutter/material.dart';
import 'package:hpos_appstore/utils/colors.dart';
import 'package:hpos_appstore/utils/numericals.dart';

ButtonStyle filterBtnWhite = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.dark),
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primaryW25),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    )));

ButtonStyle filterBtnPrimary = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
    backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
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
    shadowColor: AppColors.shadow.withOpacity(0.25),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Numericals.double16),
      ),
    ),
  ),
);
