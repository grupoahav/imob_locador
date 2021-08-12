import 'package:flutter/material.dart';

class ImobColors {
  ImobColors._();
  static const int _blue = 0xFF2F416A;
  static const MaterialColor blue = MaterialColor(
    _blue,
    <int, Color>{
      50: Color(0xFFE0E9F0),
      100: Color(0xFFB3C7DB),
      200: Color(0xFF80A2C3),
      300: Color(0xFF4D7DAA),
      400: Color(0xFF266198),
      500: Color(_blue),
      600: Color(0xFF003E7E),
      700: Color(0xFF003673),
      800: Color(0xFF002E69),
      900: Color(0xFF001F56),
    },
  );

  static const blueLight = Color(0xFFCAD3E7);
  static const blueDark = Color(0xFF192339);

  static const black = Color(0xFF707070);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFC4C4C4);

  static const green = Color(0xFF009E84);
  static const greenLight = Color(0xFF7CDFB8);
  static const greenDark = Color(0xFF047260);

  static const red = Color(0xFFEF303C);
  static const redLight = Color(0xFFFFB1B6);

  static const yellow = Color(0xFFFCC418);
  static const yellowLight = Color(0xFFFCD553);
}
