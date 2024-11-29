import 'package:flutter/material.dart';

sealed class ColorsConstants {
  static const black = Color(0xFF0C0C0C);
  static const blue = Color(0xFF354C6B);
  static const grey = Color(0xFF3A3A3A);
  static const ligthGrey = Color(0xFFD3D3D3);
  static const white = Color(0xFFEAEAEA);
  static const white50 = Color(0x80EAEAEA);
  static const yellow = Color(0xFFF4EA7F);

  static const backgroundColor = black;
  static const highlightColor = blue;
  static const iconsColor = black;
  static const textColor = ligthGrey;
}

sealed class FontConstants {
  // static const fontFamily = 'LifeSavers';
}

sealed class ImageConstants {
  static const textLogo = 'assets/images/text_logo.png';
  // static const starLogo = 'assets/images/famplay_logo.png';
  // static const orangeBg = 'assets/images/orange_bg.png';
  // static const whiteBg = 'assets/images/white_bg.png';
  // static const filhos = 'assets/images/icon_filho.png';
  // static const premios = 'assets/images/icon_premio.png';
  // static const tarefas = 'assets/images/icon_tarefa.png';
  // static const validar = 'assets/images/icon_validar.png';
}