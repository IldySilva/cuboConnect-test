import 'package:flutter/material.dart';

class AppThemeData {

  static  final Color _mainColor=Colors.lightBlue.shade800;
  static ThemeData get theme => ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _mainColor
        ),
        primaryColor: _mainColor,
        scaffoldBackgroundColor: _mainColor,
        appBarTheme: AppBarTheme(
          backgroundColor:  _mainColor,
          centerTitle: true,
          elevation: 0,
        ),
      );
}
