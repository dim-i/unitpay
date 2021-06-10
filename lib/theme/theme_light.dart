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

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    selectedIconTheme: IconThemeData(color: Colors.grey[200]),
    selectedItemColor: Colors.grey[200],
  ),

  buttonTheme: ButtonThemeData(
    buttonColor:  Colors.grey[200],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.grey[500]),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(5));
      }),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.grey[200],
    prefixStyle: TextStyle(color: Colors.grey[200]),
    focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE))),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)),
    hintStyle: TextStyle(color: Color(0xFFEEEEEE)),
    errorStyle: TextStyle(color: Colors.orange[600]),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:  Color(0xFFFB8C00))),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color:  Color(0xFFFB8C00))),
    helperStyle: TextStyle(color: Color(0xFFEEEEEE)),
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