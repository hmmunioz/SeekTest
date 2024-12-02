import 'package:seektest/app/common_widgets/custom_transition.dart';
import 'package:flutter/material.dart';
import 'package:seektest/app/constants/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seektest/app/utils/size_config.dart';

class AppStyles {
  static TextStyle titleStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required BuildContext context,
  }) {
    fontSize ??= 18.w;
    color ??= Theme.of(context).primaryColorLight;
    fontWeight ??= FontWeight.bold;

    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'YuGiOhMatrix',
    );
  }

  static TextStyle btnLargStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required BuildContext context,
  }) {
    fontSize ??= SizeConfig.sm;
    color ??= Theme.of(context).primaryColorLight;
    fontWeight ??= FontWeight.bold;

    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 18.w,
      fontFamily: 'YuGiOhMatrix',
    );
  }

  static TextStyle bubbleTitleStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required BuildContext context,
  }) {
    fontSize ??= SizeConfig.md;
    color ??= Theme.of(context).primaryColorLight;
    fontWeight ??= FontWeight.bold;

    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'YuGiOhMatrix',
    );
  }

  static TextStyle bubbleHeaderTitleStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required BuildContext context,
  }) {
    fontSize ??= SizeConfig.md;
    color ??= Theme.of(context).primaryColorLight;
    fontWeight ??= FontWeight.bold;

    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'YuGiOhMatrix',
    );
  }

  static TextStyle bubbleSubTitleStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required BuildContext context,
  }) {
    fontSize ??= SizeConfig.sm;
    color ??= Theme.of(context).primaryColorLight;
    fontWeight ??= FontWeight.normal;

    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'YuGiOhMatrix',
    );
  }

  static IconThemeData iconStyle({
    double? size,
    Color? color,
    required BuildContext context,
  }) {
    size ??= SizeConfig.md;
    color ??= Theme.of(context).primaryColorLight;

    return IconThemeData(
      size: size,
      color: color,
    );
  }

  static ThemeData appThemeLight = ThemeData(
    primaryColor: ColorsTheme.deepSpace,
    primaryColorDark: ColorsTheme.deathStar,
    primaryColorLight: ColorsTheme.leiaWhite,
    secondaryHeaderColor: ColorsTheme.lightsaberBlue,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomTransition(),
        TargetPlatform.iOS: CustomTransition(),
      },
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      titleMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      bodySmall: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      displayMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
    ),
  );

  static ThemeData appThemeDark = ThemeData(
    primaryColor: ColorsTheme.leiaWhite,
    primaryColorDark: ColorsTheme.leiaWhite,
    primaryColorLight: ColorsTheme.deepSpace,
    secondaryHeaderColor: ColorsTheme.lightsaberBlue,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomTransition(),
        TargetPlatform.iOS: CustomTransition(),
      },
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      titleMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      bodySmall: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
      displayMedium: TextStyle(
        fontFamily: 'YuGiOhMatrix',
      ),
    ),
  );
}
