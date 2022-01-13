import 'dart:ui';

import 'package:calculator/main.dart';

class Utils {
  static const backgrounColorStart = Color(0xffb8b8b8);
  static const backgrounColorEnd = Color(0xfffafafa);
  static const offsetValue = 5.0;
  static const blurRadius = 15.0;
  static const spreadRadius = 3.0;
  static List<ButtonType> firstRow = [
    ButtonType.Btn0,
    ButtonType.BtnDot,
    ButtonType.BtnBackspace,
    ButtonType.BtnResult
  ];
  static List<ButtonType> secondRow = [
    ButtonType.Btn1,
    ButtonType.Btn2,
    ButtonType.Btn3,
    ButtonType.BtnAdd
  ];
  static List<ButtonType> thirdRow = [
    ButtonType.Btn4,
    ButtonType.Btn5,
    ButtonType.Btn6,
    ButtonType.BtnMinus
  ];
  static List<ButtonType> fourthRow = [
    ButtonType.Btn7,
    ButtonType.Btn8,
    ButtonType.Btn9,
    ButtonType.BtnCompound
  ];
  static List<ButtonType> fifthRow = [
    ButtonType.BtnClear,
    ButtonType.BtnNegative,
    ButtonType.BtnPercent,
    ButtonType.BtnDivide
  ];
  static String buttonTitle(ButtonType type) {
    switch (type) {
      case ButtonType.Btn1:
        return '1';
      case ButtonType.Btn0:
        return '0';
      case ButtonType.Btn2:
        return '2';
      case ButtonType.Btn3:
        return '3';
      case ButtonType.Btn4:
        return '4';
      case ButtonType.Btn5:
        return '5';
      case ButtonType.Btn6:
        return '6';
      case ButtonType.Btn7:
        return '7';
      case ButtonType.Btn8:
        return '8';
      case ButtonType.Btn9:
        return '9';
      case ButtonType.BtnDot:
        return '.';
      case ButtonType.BtnDivide:
        return '/';
      case ButtonType.BtnResult:
        return '=';
      case ButtonType.BtnPercent:
        return '%';
      case ButtonType.BtnAdd:
        return '+';
      case ButtonType.BtnBackspace:
        return '⌫';
      case ButtonType.BtnClear:
        return 'C';
      case ButtonType.BtnCompound:
        return '×';
      case ButtonType.BtnMinus:
        return '-';
      case ButtonType.BtnNegative:
        return '+/-';
      default:
        return '';
    }
  }

  static String buttonValue(ButtonType type) {
    switch (type) {
      case ButtonType.Btn1:
        return '1';
      case ButtonType.Btn0:
        return '0';
      case ButtonType.Btn2:
        return '2';
      case ButtonType.Btn3:
        return '3';
      case ButtonType.Btn4:
        return '4';
      case ButtonType.Btn5:
        return '5';
      case ButtonType.Btn6:
        return '6';
      case ButtonType.Btn7:
        return '7';
      case ButtonType.Btn8:
        return '8';
      case ButtonType.Btn9:
        return '9';
      case ButtonType.BtnDot:
        return '.';
      case ButtonType.BtnDivide:
        return '/';
      case ButtonType.BtnResult:
        return '=';
      case ButtonType.BtnPercent:
        return '%';
      case ButtonType.BtnAdd:
        return '+';
      case ButtonType.BtnBackspace:
        return '⌫';
      case ButtonType.BtnClear:
        return 'C';
      case ButtonType.BtnCompound:
        return '×';
      case ButtonType.BtnMinus:
        return '-';
      case ButtonType.BtnNegative:
        return '+/-';
      default:
        return '0';
    }
  }
}
