import 'package:flutter/material.dart';

ThemeData _themeDark = ThemeData.dark();

ThemeData themeDark = _themeDark.copyWith(
  primaryColorLight: Colors.grey[900],
  primaryColorDark: Colors.grey[900],
  primaryColor: Colors.grey[900],
  primaryIconTheme: IconThemeData(color: Colors.grey[200]),
  hintColor: Colors.black54,
  backgroundColor: Colors.grey[900],
  focusColor: Colors.grey[200],
  splashColor: Colors.grey[200],
  accentColor: Colors.black54,

  appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(color: Colors.grey[200]),
      textTheme: _textAppBar(_themeDark.textTheme)
  ),

  buttonTheme: ButtonThemeData(
    buttonColor:  Colors.grey[500],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
    ),
  ),

  cardTheme: CardTheme(
    color: Colors.grey[900],
    //clipBehavior: Clip.antiAliasWithSaveLayer,
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(16),
    // ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
      }),
    ),
  ),


  textTheme: _textLight(_themeDark.textTheme),
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
        color: Colors.white
    ),
    bodyText2: base.bodyText1!.copyWith(
        color: Colors.white
    ),
  );
}