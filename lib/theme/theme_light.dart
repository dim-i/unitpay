import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  primaryColorLight: Colors.grey[200],
  primaryColorDark: Colors.grey[500],
  primaryColor: Colors.grey[300],
  primaryIconTheme: IconThemeData(color: Colors.grey[200]),
  hintColor: Colors.black54,
  backgroundColor: Colors.grey[200],
  focusColor: Colors.grey[200],
  splashColor: Colors.grey[200],
  accentColor: Colors.black54,

  appBarTheme: AppBarTheme(
      color: Colors.black54,
      iconTheme: IconThemeData(color: Colors.grey[200]),
      textTheme: _textAppBar(_themeLight.textTheme)
  ),

  buttonTheme: ButtonThemeData(
    buttonColor:  Colors.grey[200],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
    ),
  ),

  cardTheme: CardTheme(
    color: Colors.grey[200],
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
      }),
    ),
  ),


  textTheme: _textLight(_themeLight.textTheme),
);

TextTheme _textAppBar(TextTheme base){
  return base.copyWith(
    headline4: base.headline4!.copyWith(
        color: Colors.grey[200]
    ),
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headline4: base.headline6!.copyWith(
        color: Colors.black54
    ),
    bodyText2: base.bodyText1!.copyWith(
        color: Colors.black54
    ),
  );
}