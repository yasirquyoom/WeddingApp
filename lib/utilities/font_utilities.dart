import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FontFamily {
  static const String mediumInter = "InterMedium";
  static const String regularInter = "InterRegular";
  static const String semiBoldInter = "InterSemiBold";
}

class FontUtilities {
  static TextStyle h12(
      {Color? color,
      String? fontFamily,
      double? letterSpacing,
      TextDecoration? decoration,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: 0.027 * Get.width,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h14(
      {Color? color,
      String? fontFamily,
      double? letterSpacing,
      TextDecoration? decoration,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: 0.038 * Get.width,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h16(
      {required Color color,
      String? fontFamily,
      TextDecoration? decoration,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontSize: 0.04 * Get.width,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h18(
      {required Color color,
      String? fontFamily,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontSize: 0.045 * Get.width,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h20(
      {required Color color,
      String? fontFamily,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontSize: 0.048 * Get.width,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h24(
      {required Color color,
      String? fontFamily,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontSize: 0.062 * Get.width,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }

  static TextStyle h26(
      {required Color color,
      String? fontFamily,
      double? letterSpacing,
      FontWeight? fontWeight}) {
    return TextStyle(
        color: color,
        fontSize: 0.065 * Get.width,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? FontFamily.mediumInter,
        fontWeight: fontWeight);
  }
}
