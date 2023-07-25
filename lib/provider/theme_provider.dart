import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      backgroundColor: HexColor('#00478d'),
    ),
  );

  ThemeData get theme => _theme;

  void toggleTheme() {
    final isDark = _theme ==
        ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.blueGrey,
            appBarTheme: AppBarTheme(
            backgroundColor: HexColor('#00478d')
    ,),
    );

    if (isDark) {
    _theme = ThemeData.dark();
    } else {
    _theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.blueGrey,
      appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#00478d'),
    ),
    );
    }
    notifyListeners
    (
    );
  }
}
