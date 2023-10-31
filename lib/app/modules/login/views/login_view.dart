import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      body: Column(
        children: [
          Spacer(),
          Image.asset(
            "assets/img/logo_with_name.png",
            width: 224,
            height: 44,
            fit: BoxFit.fill,
          ),
          Spacer(flex: 2),
          logInButton(
              onTap: () {
                Get.toNamed("/phone-log-in");
              },
              isSelected: true,
              title: "Login with number",
              image: "assets/icons/phone.png"),
          SizedBox(
            height: 20,
          ),
          logInButton(
              onTap: () {
                Get.toNamed("/sign-up");
              },
              isSelected: false,
              title: "Login with google",
              image: "assets/icons/google_logo.png"),
          Spacer(),
        ],
      ),
    );
  }

  Widget logInButton(
      {required bool isSelected,
      required String title,
      required Function() onTap,
      required String image}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: 46,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: FontUtilities.h16(
                  color: isSelected
                      ? ColorUtilities.goldenColor
                      : ColorUtilities.white),
            ),
            SizedBox(
              width: 15,
            ),
            Image.asset(
              image,
              height: 25,
              width: image.split("/").last.contains("phone") == true ? 15 : 25,
              fit: BoxFit.fill,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: ColorUtilities.offButtonColor,
          borderRadius: BorderRadius.circular(23),
          border: Border.all(
            width: 1,
            color: isSelected
                ? ColorUtilities.goldenColor
                : ColorUtilities.offButtonColor,
          ),
        ),
      ),
    );
  }
}
