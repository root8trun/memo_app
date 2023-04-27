import 'package:flutter/material.dart';

class SettingModel extends ChangeNotifier {
  ThemeData themeData = ThemeData(
    useMaterial3: false,
    //primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    //textTheme: ThemeData().textTheme.apply(fontSizeFactor: 1.0),
    textTheme: TextTheme(titleMedium: TextStyle(fontSize: 30.0)),
  );

  double fontSize = 16.0;

  void changeTheme(ThemeData themeData) {
    themeData = themeData;
    notifyListeners();
  }

  void changeColor(ColorScheme newColorScheme) {
    themeData = ThemeData(
      useMaterial3: false,
      colorScheme: newColorScheme,
      //textTheme: themeData.textTheme.apply(fontSizeFactor: fontSize / 16.0),
    );
    notifyListeners();
  }

  void updateFontSize(double newFontSize) {
    fontSize = newFontSize;
    print(fontSize);

    themeData = ThemeData(
      useMaterial3: false,
      colorScheme: themeData.colorScheme,
      //textTheme: themeData.textTheme.apply(fontSizeFactor: 30 / 16.0),
      //textTheme: themeData.textTheme.apply(fontSizeDelta: 0.1),
      textTheme: TextTheme(titleMedium: TextStyle(fontSize: newFontSize)),
    );

    notifyListeners();
  }

  void updateFontSize2(TextTheme textTheme) {
    themeData = ThemeData(
      useMaterial3: false,
      colorScheme: themeData.colorScheme,
      //textTheme: themeData.textTheme.apply(fontSizeFactor: 30 / 16.0),
      textTheme: textTheme,
    );

    notifyListeners();
  }
}
