import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class AddMediaButtonWidget extends StatelessWidget {
  Function() onTap;

  AddMediaButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorUtilities.offButtonColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/AddMedia.png",
              scale: 4,
            ),
            SizedBox(
              height: Get.width * 0.03,
            ),
            Text(
              "Add Media",
              style: FontUtilities.h16(
                color: ColorUtilities.white,
                fontFamily: FontFamily.semiBoldInter,
              ),
            )
          ],
        ),
      ),
    );
  }
}
