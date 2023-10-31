import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/event_detail/views/event_members_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

AppBar customAppBar({Function()? onTap, String? title, bool isIcon = false}) {
  return AppBar(
    elevation: 0,
    centerTitle: false,
    backgroundColor: ColorUtilities.backgroundColor,
    actions: isIcon
        ? [
            GestureDetector(
              onTap: () {
                Get.to(() => const EventMembersView());
              },
              child: Image.asset(
                "assets/img/people.png",
                scale: 4,
              ),
            ),
          ]
        : [SizedBox()],
    title: Text(title ?? "",
        style: FontUtilities.h24(
            color: Colors.white, fontFamily: FontFamily.semiBoldInter)),
    leading: IconButton(
      onPressed: onTap ??
          () {
            Get.back();
          },
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 25,
      ),
    ),
  );
}
