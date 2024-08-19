import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/my_colors.dart';
import 'size.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    primaryColor: MyColors.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.primaryColor,
      centerTitle: true,
      foregroundColor: MyColors.secondaryColor,
      actionsIconTheme: IconThemeData(
        color: MyColors.secondaryColor,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColors.secondaryColor,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: MyColors.primaryColor,
        foregroundColor: MyColors.secondaryColor,
        textStyle: Theme.of(context).textTheme.bodySmall,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColors.primaryColor,
      iconSize: SizeConfig.screenHeight,
      foregroundColor: MyColors.secondaryColor,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.displayMedium),
      displaySmall: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.displaySmall),
      titleMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleMedium),
      labelSmall: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.labelSmall),
      labelMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.labelMedium),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: MyColors.hintColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: SizeConfig.screenHeight! * 0.001,
          color: MyColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          SizeConfig.screenHeight! * 0.01,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: SizeConfig.screenHeight! * 0.001,
            color: MyColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.screenHeight! * 0.01,
          )),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: SizeConfig.screenWidth! * 0.001,
          color: MyColors.errorColor,
        ),
        borderRadius: BorderRadius.circular(
          SizeConfig.screenHeight! * 0.01,
        ),
      ),
    ),
  );
}