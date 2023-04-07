import 'package:flutter/material.dart';
import 'package:textly_ui/textly_ui.dart';

final dartTheme = ThemeData(
  extensions: const [
    TextlyScafoldTheme(backgroundColor: Color(0xFFFAFAFA)),
    TextlyAppbarTheme(backgroundColor: Colors.black)
  ],
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'TT Norms Pro',
      fontSize: 24,
      color: Colors.white,
    ),
    backgroundColor: Colors.black,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'TT Norms Pro',
          fontSize: 18,
        ),
      ),
      minimumSize: const MaterialStatePropertyAll(Size.fromHeight(50)),
      elevation: const MaterialStatePropertyAll(0),
      backgroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  ),
);
