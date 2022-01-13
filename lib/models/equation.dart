// To parse this JSON data, do
//
//     final equation = equationFromJson(jsonString);

import 'dart:convert';

Equation equationFromJson(String str) => Equation.fromJson(json.decode(str));

String equationToJson(Equation data) => json.encode(data.toJson());

class Equation {
  Equation({
    required this.first,
    this.second,
    required this.equation,
    required this.result,
  });

  String first;
  String? second;
  String equation;
  String result;

  factory Equation.fromJson(Map<String, dynamic> json) => Equation(
        first: json["first"],
        second: json["second"],
        equation: json["equation"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "second": second,
        "equation": equation,
        "result": result,
      };
  String displayEquation() {
    if (result.length > 15) {
      return '';
    }
    return "$first $equation $second";
  }
}
