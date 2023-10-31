import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

Widget customButton(
    {required Function() onTap,
    required bool isDisable,
    required String title}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 46,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: isDisable
              ? ColorUtilities.offButtonColor
              : ColorUtilities.goldenColor),
      child: Center(
        child: Text(
          // "Continue",
          "$title",
          style: FontUtilities.h16(
              color: isDisable
                  ? ColorUtilities.offWhite
                  : ColorUtilities.offButtonColor),
        ),
      ),
    ),
  );
}
