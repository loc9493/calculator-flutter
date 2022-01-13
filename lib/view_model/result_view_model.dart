import 'package:calculator/main.dart';
import 'package:calculator/models/equation.dart';
import 'package:calculator/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultViewModel extends ChangeNotifier {
  var result = '';
  var input = '';
  var first = '';
  var second = '';
  List<Equation> history = [];
  ButtonType? equation;
  void _clear() {
    result = '';
    first = '';
    second = '';
    equation = null;
  }

  void didTapButton(ButtonType btnType) {
    switch (btnType) {
      case ButtonType.BtnClear:
        _clear();
        break;
      case ButtonType.BtnPercent:
        result = (double.parse(result) / 100).toString();
        break;
      case ButtonType.BtnNegative:
        result = (double.parse(result) * -1).toString();
        break;
      case ButtonType.BtnMinus:
      case ButtonType.BtnAdd:
      case ButtonType.BtnCompound:
      case ButtonType.BtnDivide:
        _didTapCommandButton(btnType);
        break;
      case ButtonType.BtnResult:
        _calcResult();
        break;
      default:
        result = result + Utils.buttonValue(btnType);
    }

    notifyListeners();
  }

  String getCurrentEquation() {
    if (equation == null) {
      return '';
    }
    return Utils.buttonTitle(equation!);
  }

  void _didTapCommandButton(ButtonType btnType) {
    if (result == '') {
      return;
    }
    if (equation == null) {
      first = result;
      result = '';
      equation = btnType;
    } else {
      _calcResult();
    }
  }

  void _calcResult() {
    second = result;
    switch (equation) {
      case ButtonType.BtnAdd:
        result = (double.parse(first) + double.parse(result)).toString();
        break;
      case ButtonType.BtnMinus:
        result = (double.parse(first) - double.parse(result)).toString();
        break;
      case ButtonType.BtnCompound:
        result = (double.parse(first) * double.parse(result)).toString();
        break;
      case ButtonType.BtnDivide:
        result = (double.parse(first) / double.parse(result)).toString();
        break;
      default:
    }
    history.insert(
        0,
        Equation(
            first: first,
            equation: getCurrentEquation(),
            result: result,
            second: second));
    equation = null;
    first = '';
    second = '';
  }
}
