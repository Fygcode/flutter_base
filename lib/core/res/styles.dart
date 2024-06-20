import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'fontsize.dart';

class AppStyle {
  static const String fontFamily = "Manrope";

  static final ThemeData appTheme = ThemeData(
      primaryColor: AppColor.primary,
      primaryColorDark: AppColor.primary,
      dividerColor: AppColor.outline,
      indicatorColor: AppColor.primary,
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headlineMedium : AppTextStyle.bodyText1.copyWith(fontWeight: FontWeight.w600),
      ),

      scaffoldBackgroundColor: AppColor.surface,
      // tooltipTheme: TooltipThemeData(
      //   decoration: ShapeDecoration(
      //     color: Color(0xFF232F34),
      //     shape: StadiumBorder(),
      //   ),
      //   textStyle: TextStyle(color: Colors.white),
      // ),
      appBarTheme: const AppBarTheme(
          color: AppColor.background,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColor.primary,
          ),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.textOnPrimary,
              letterSpacing: 0.1)), colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.error ,
        primary: AppColor.primary, //<-- SEE HERE
      ).copyWith(background: AppColor.background));

  static final List<BoxShadow> cardShadow = [
    BoxShadow(
        color: Colors.black.withOpacity(0.08), spreadRadius: 0, blurRadius: 4),
  ];

  static const Widget customDivider = SizedBox(
    height: 0.6,
    child: Divider(
      color: AppColor.outline,
      thickness: 1.2,
    ),
  );

  static Decoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
  );

  static final List<BoxShadow> mildCardShadow = [
    BoxShadow(
        color: AppColor.secondary.withOpacity(0.2),
        spreadRadius: 0.5,
        blurRadius: 1),
  ];

  static List<Shadow> textShadow = <Shadow>[
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: Colors.black12,
    ),
    const Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black12,
    ),
  ];
}

class AppTextStyle {
  static TextStyle title = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.title,
    letterSpacing: 0.12,
  );

  static TextStyle disable = const TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w300,
      color: AppColor.textOnPrimary,
      letterSpacing: -0.5);

  static TextStyle headline3 = const TextStyle(
    fontSize: 51,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
  );

  static TextStyle headline4 = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: AppColor.textOnPrimary,
      letterSpacing: 0.25);

  static TextStyle headline5 = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColor.textOnPrimary,
  );

  static TextStyle headline6 = const TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.w500,
      color: AppColor.textOnPrimary,
      letterSpacing: 0.15);

  static TextStyle subtitle1 = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.textOnPrimary,
      letterSpacing: 0.12);

  static TextStyle subtitle2 = const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColor.textOnPrimary,
      letterSpacing: 0.1);

  static TextStyle button = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.background,
      letterSpacing: 1.25);

  static TextStyle caption = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Color(0x80000000),
      letterSpacing: 0.12);

  static TextStyle overline = const TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColor.textOnPrimary,
      letterSpacing: 1.5,
      height: 3);

  static TextStyle authText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColor.primary,
      letterSpacing: 0.12);

  //Muthu

  static TextStyle smallText = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColor.white,
      letterSpacing: 0.12);

  static TextStyle headline1 = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColor.title,
      letterSpacing: 0.12);

  static TextStyle quotes = const TextStyle(
      fontSize: 54,
      fontWeight: FontWeight.w700,
      color: AppColor.disable,
      letterSpacing: 0,
      height: 50);

  static TextStyle purpose = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColor.blueGradient,
      letterSpacing: 0.12);

//Tamil
  static TextStyle H3 = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );
  static TextStyle H4 = const TextStyle(
    fontSize: 52,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );
  static TextStyle H5 = const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );
  static TextStyle H6 = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );
  static TextStyle title34 = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle title24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.12,
  );
  static TextStyle title32 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle subTitle20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle small12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.primary,
    letterSpacing: 0.5,
  );
  static TextStyle subTitle18 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.5,
  );
  static TextStyle bodyText1 = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.textOnPrimary,
      letterSpacing: 0.5);
  static TextStyle bodyText2 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.textOnPrimary,
    letterSpacing: 0.12,
  );

  static TextStyle subHeading = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColor.subHeading,
      letterSpacing: 0.12);

  static TextStyle tab = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.12,
  );
}
