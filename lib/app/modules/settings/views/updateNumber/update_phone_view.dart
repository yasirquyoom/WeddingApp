import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:wedding_app/app/modules/settings/views/updateNumber/veryfy_otp.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';

class UpdatePhoneView extends GetView<SettingsController> {
  UpdatePhoneView({Key? key}) : super(key: key);
  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorUtilities.backgroundColor,
        appBar: customAppBar(
          title: "Change number",
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.width * 0.1,
                ),
                Image.asset(
                  'assets/img/changeNumber.png',
                  scale: 4,
                ),
                SizedBox(
                  height: Get.width * 0.1,
                ),
                Text(
                  "Current phone number",
                  style: FontUtilities.h18(
                    fontFamily: FontFamily.mediumInter,
                    color: ColorUtilities.white,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: controller.newNumberLength
                          ? Colors.red
                          : ColorUtilities.offWhite,
                    ),
                  ),
                  child: CountryCodePicker(
                    barrierColor: ColorUtilities.backgroundColor,
                    onChanged: print,
                    initialSelection: 'IN',
                    hideMainText: true,
                    favorite: const ['In', '+91'],
                    builder: (p0) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "${p0!.dialCode}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    p0.flagUri ?? "",
                                    package: 'country_code_picker',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Container(
                                height: Get.height * 0.03,
                                width: 2,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.mobileNumberController,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  autofocus: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  // readOnly: isBlue ?? false,
                                  onChanged: (value) {
                                    controller.number = value;
                                  },
                                  style: FontUtilities.h14(
                                    color: ColorUtilities.white,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter your phone number",
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    hintStyle: FontUtilities.h14(
                                      fontFamily: FontFamily.mediumInter,
                                      color: ColorUtilities.offWhite,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onInit: (code) {
                      log("on init ${code?.dialCode}");
                    },
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.018,
                ),
                controller.numberLength
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "* Mobile Number 10 digit is Required",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: Get.width * 0.05,
                ),
                Text(
                  "New phone number",
                  style: FontUtilities.h18(
                    fontFamily: FontFamily.mediumInter,
                    color: ColorUtilities.white,
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: controller.numberLength
                          ? Colors.red
                          : ColorUtilities.offWhite,
                    ),
                  ),
                  child: CountryCodePicker(
                    barrierColor: ColorUtilities.backgroundColor,
                    onChanged: print,
                    initialSelection: 'IN',
                    hideMainText: true,
                    favorite: const ['In', '+91'],
                    builder: (p0) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                "${p0!.dialCode}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    p0.flagUri ?? "",
                                    package: 'country_code_picker',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Get.width * 0.05,
                              ),
                              Container(
                                height: Get.height * 0.03,
                                width: 2,
                                color: Colors.white,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: controller.newNumberController,
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,
                                  autofocus: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  // readOnly: isBlue ?? false,
                                  onChanged: (value) {
                                    controller.newNumber = value;
                                  },
                                  style: FontUtilities.h14(
                                    color: ColorUtilities.white,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter your phone number",
                                    contentPadding: EdgeInsets.only(
                                        left: 20, top: 10, right: 20),
                                    hintStyle: FontUtilities.h14(
                                      fontFamily: FontFamily.mediumInter,
                                      color: ColorUtilities.offWhite,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    onInit: (code) {
                      log("on init ${code?.dialCode}");
                    },
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.018,
                ),
                controller.newNumberLength
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "* Mobile Number 10 digit is Required",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      )
                    : SizedBox(),
                SizedBox(
                  height: Get.width * 0.03,
                ),
                customButton(
                  onTap: () {
                    if (controller.number.length != 10 ||
                        controller.newNumber.length != 10) {
                      controller.numberLength = true;
                      controller.newNumberLength = true;
                    } else {
                      Get.off(() => const ChangeNumberOtpVerifyView());
                      controller.numberLength = false;
                      controller.newNumberLength = false;
                    }
                  },
                  isDisable: controller.number.length == 10 &&
                          controller.newNumber.length == 10
                      ? false
                      : true,
                  title: "Continue",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
