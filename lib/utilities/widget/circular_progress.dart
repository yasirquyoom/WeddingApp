import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/event_members_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

Widget circularProgressIndicator() {
  return Container(
    color: ColorUtilities.offGray.withOpacity(0.2),
    child: Center(
      child: CircularProgressIndicator(
        color: ColorUtilities.goldenColor,
      ),
    ),
  );
}
