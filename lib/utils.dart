import 'dart:io';
import 'dart:ui';

import 'package:calculator/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Utils {
  static const backgrounColorStart = Color(0xffb8b8b8);
  static const backgrounColorEnd = Color(0xfffafafa);
  static const offsetValue = 5.0;
  static const blurRadius = 15.0;
  static const spreadRadius = 3.0;
  static const shouldDisplayAds = true;
  static const bannerAdsID = "ca-app-pub-1436979433677675/4834834219";
  static const bannerAdsID1 = "ca-app-pub-1436979433677675/3797084715";
  static const interestialAdsID = "ca-app-pub-3940256099942544/1033173712";

  static double adsBannerHeight() {
    return shouldDisplayAds ? 50 : 0;
  }

  static String bannerAdpubID() {
    //Develop pub id
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }
    //Production pub id
    return Platform.isAndroid
        ? bannerAdsID1
        : 'ca-app-pub-1436979433677675/5764147781';
  }

  static String bannerAdpubID1() {
    //Develop pub id
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }
    //Production pub id
    return Platform.isAndroid
        ? bannerAdsID
        : 'ca-app-pub-1436979433677675/7737712619';
  }

  static BannerAd homeBanner = BannerAd(
    adUnitId: bannerAdpubID1(),
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  static BannerAd detailBanner = BannerAd(
    adUnitId: bannerAdpubID(),
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

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

  static Color buttonColor(ButtonType type) {
    switch (type) {
      case ButtonType.BtnDivide:
        return Colors.orangeAccent;
      case ButtonType.BtnResult:
        return Colors.orangeAccent;
      case ButtonType.BtnPercent:
        return Colors.white;
      case ButtonType.BtnAdd:
        return Colors.orangeAccent;
      case ButtonType.BtnBackspace:
        return Colors.white;
      case ButtonType.BtnClear:
        return Colors.redAccent;
      case ButtonType.BtnCompound:
        return Colors.orangeAccent;
      case ButtonType.BtnMinus:
        return Colors.orangeAccent;
      case ButtonType.BtnNegative:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  static Color textColor(ButtonType type) {
    switch (type) {
      case ButtonType.BtnDivide:
        return Colors.white;
      case ButtonType.BtnResult:
        return Colors.white;
      case ButtonType.BtnAdd:
        return Colors.white;
      case ButtonType.BtnClear:
        return Colors.white;
      case ButtonType.BtnCompound:
        return Colors.white;
      case ButtonType.BtnMinus:
        return Colors.white;
      default:
        return Colors.black;
    }
  }
}
