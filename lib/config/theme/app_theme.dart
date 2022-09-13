import 'package:clean_unittest/config/theme/app_fonts.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

class AppThemes {
  static Brightness? get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static ThemeData themeData(bool isDarkTheme) {
    return isDarkTheme ? darkTheme : lightTheme;
  }

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.orange,
      primaryColor: primaryDarkColor,
      accentColor: accentDarkColor,
      backgroundColor: backgroundDarkColor,
      scaffoldBackgroundColor: scaffoldBackgroundDarkColor,
      canvasColor: canvasDarkColor,
      hintColor: hintDarkColor,
      highlightColor: highlightDarkColor,
      hoverColor: hoverColorDarkColor,
      focusColor: focusColor,
      disabledColor: disabledTextDarkColor,
      cardColor: cardDarkColor,
      errorColor: errorColor,
      textTheme: _customTextTheme(
          ThemeData.dark().textTheme, textDarkColor, "darkTheme"),
      primaryTextTheme: _customTextTheme(
          ThemeData.dark().primaryTextTheme, textDarkColor, "darkTheme"),
      indicatorColor: indicatorDarkColor,
      iconTheme: const IconThemeData(color: errorColor, opacity: 0.8),
      colorScheme: const ColorScheme.dark(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundDarkColor,
        selectedItemColor: bottomNavigationBarSelectedIconDarkColor,
        unselectedItemColor: bottomNavigationBarUnSelectedIconDarkColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconDarkColor),
        unselectedIconTheme:
            IconThemeData(color: bottomNavigationBarUnSelectedIconDarkColor),
        showUnselectedLabels: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateColor.resolveWith((states) => disabledColor),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => buttonColor))),
      buttonTheme: ThemeData.dark().buttonTheme.copyWith(
          buttonColor: buttonDarkColor,
          disabledColor: disabledColor,
          colorScheme: ThemeData.dark()
              .colorScheme
              .copyWith(secondary: buttonDarkColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintDarkColor),
        labelStyle: TextStyle(color: labelDarkColor),
        filled: true,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundDarkColor,
        foregroundColor: appBarTextDarkColor,
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16,
            color: appBarTextDarkColor,
            fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: tabSelectedDarkColor,
          unselectedLabelColor: tabUnSelectedDarkColor,
          indicator: BoxDecoration(color: tabUnSelectedIndicatorDarkColor)));
  static ThemeData lightTheme = ThemeData(
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
      accentColor: accentColor,
      canvasColor: canvasColor,
      errorColor: errorColor,
      iconTheme: const IconThemeData(color: iconColor, opacity: 0.8),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      focusColor: focusColorDarkColor,
      hintColor: hintColor,
      indicatorColor: indicatorColor,
      disabledColor: disabledTextColor,
      cardColor: cardColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: bottomNavigationBarBackgroundColor,
        selectedItemColor: bottomNavigationBarSelectedIconColor,
        unselectedItemColor: bottomNavigationBarUnSelectedIconColor,
        selectedIconTheme:
            IconThemeData(color: bottomNavigationBarSelectedIconColor),
        unselectedIconTheme:
            IconThemeData(color: bottomNavigationBarUnSelectedIconColor),
        showUnselectedLabels: true,
      ),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
          buttonColor: buttonColor,
          colorScheme:
              ThemeData.light().colorScheme.copyWith(secondary: buttonColor)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: hintColor),
        labelStyle: TextStyle(color: labelColor),
        filled: true,
      ),
      primaryIconTheme: ThemeData.light()
          .primaryIconTheme
          .copyWith(color: const Color(0xFF442B2D)),
      textTheme: _customTextTheme(
          ThemeData.light().textTheme, textColor, "lightTheme"),
      primaryTextTheme: _customTextTheme(
          ThemeData.light().primaryTextTheme, textColor, "lightTheme"),
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarStatusBackgroundColor,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: appBarBackgroundColor,
        foregroundColor: appBarTextColor,
        centerTitle: false,
        toolbarTextStyle: TextStyle(
            fontSize: 16, color: appBarTextColor, fontWeight: FontWeight.bold),
      ),
      tabBarTheme: const TabBarTheme(
          labelColor: tabSelectedDarkColor,
          unselectedLabelColor: tabBarUnSelectedColor,
          indicator: BoxDecoration(color: tabBarUnSelectedIndicatorColor)));

  static TextTheme _customTextTheme(TextTheme base, Color color, String theme) {
    return base
        .copyWith(
          headline6: base.headline6!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline5: base.headline5!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 24.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline4: base.headline4!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 34.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline3: base.headline3!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 48.0,
              letterSpacing: 0.0,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline2: base.headline2!.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 60.0,
              letterSpacing: -0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          headline1: base.headline1!.copyWith(
              fontWeight: FontWeight.w300,
              fontSize: 96.0,
              letterSpacing: -1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle2: base.subtitle2!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              letterSpacing: 0.10,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          subtitle1: base.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.15,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText2: base.bodyText2!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.25,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          bodyText1: base.bodyText1!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
              letterSpacing: 0.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          button: base.button!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              letterSpacing: 0.75,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          caption: base.caption!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              letterSpacing: 0.4,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
          overline: base.overline!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.0,
              letterSpacing: 1.5,
              color: theme.contains("darkTheme") ? textDarkColor : textColor),
        )
        .apply(fontFamily: FontNames.robotoMono);
  }
}
