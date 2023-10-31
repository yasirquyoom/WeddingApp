import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:wedding_app/app/modules/edit_crate_event/views/edit_event_detail.dart';

import '../../../../utilities/color_utilities.dart';
import '../../../../utilities/font_utilities.dart';
import '../../../../utilities/widget/custom_app_bar.dart';
import '../../../../utilities/widget/custom_button.dart';
import '../../../../utilities/widget/custom_textfield.dart';
import '../../signUp/views/date_picker/date_picker_widget.dart';
import '../controllers/edit_crate_event_controller.dart';

class EditCrateEventView extends GetView<EditCrateEventController> {
  const EditCrateEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditCrateEventController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorUtilities.backgroundColor,
          appBar: customAppBar(
            title: "Create Event",
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    Text(
                      "Name of the album",
                      style: FontUtilities.h18(
                        fontFamily: FontFamily.mediumInter,
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      color: ColorUtilities.offBlackColor,
                      textEditingController: controller.albumNameController,
                      hintText: "E.g John and Julia Wedding",
                      onChange: (text) {
                        controller.album = text;
                      },
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    Text(
                      "About Event",
                      style: FontUtilities.h18(
                        fontFamily: FontFamily.mediumInter,
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      maxLine: 17,
                      color: ColorUtilities.offBlackColor,
                      textEditingController: controller.aboutEventController,
                      hintText: "Write about your event",
                      onChange: (text) {
                        controller.about = text;
                      },
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    Text(
                      "Date",
                      style: FontUtilities.h18(
                        fontFamily: FontFamily.mediumInter,
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    CustomTextField(
                      color: ColorUtilities.offBlackColor,
                      readOnly: true,
                      textEditingController: controller.dateController,
                      hintText: "01/01/2001",
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        DateTime? datePicked =
                        await DatePicker.showSimpleDatePicker(
                          context,
                          backgroundColor: Color(0xff000144).withOpacity(0.4),
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now(),
                          dateFormat: "MM-dd-yyyy",
                          titleText: "Select date of birth\nMM-DD-YYYY",
                          confirmText: "CONFIRM",
                          cancelText: "Discard",
                          looping: true,
                        );
                        print("SELECTED DATE===>>>>${datePicked}");
                        controller.dateController.text =
                            datePicked.toString().substring(0, 10);
                        controller.date = !controller.date;
                      },
                    ),
                    SizedBox(
                      height: Get.width * 0.05,
                    ),
                    Text(
                      "Cover Image",
                      style: FontUtilities.h18(
                        fontFamily: FontFamily.mediumInter,
                        color: ColorUtilities.white,
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.imagePath == null) {
                          controller.getImage();
                        }
                      },
                      child: Container(
                        height: Get.width * 0.65,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: ColorUtilities.offBlackColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: controller.imagePath == null
                            ? Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Upload a cover image for your event",
                                  textAlign: TextAlign.center,
                                  style: FontUtilities.h16(
                                    color: ColorUtilities.offWhite,
                                    fontFamily: FontFamily.regularInter,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.width * 0.02,
                                ),
                                Image.asset(
                                  "assets/img/gallery_add.png",
                                  scale: 4,
                                ),
                              ],
                            ),
                          ),
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            children: [
                              Image.file(
                                File(controller.imagePath ?? ""),
                                height: Get.width * 0.65,
                                width: Get.width,
                                fit: BoxFit.fill,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.imagePath = null;
                                    },
                                    child: GlassmorphicContainer(
                                      width: Get.width * 0.13,
                                      height: Get.width * 0.13,
                                      borderRadius: 10,
                                      linearGradient: LinearGradient(
                                        colors: [
                                          ColorUtilities.offButtonColor
                                              .withOpacity(0.1),
                                          ColorUtilities.offButtonColor
                                              .withOpacity(0.1),
                                        ],
                                      ),
                                      borderGradient: LinearGradient(
                                        colors: [
                                          ColorUtilities.offButtonColor
                                              .withOpacity(0.1),
                                          ColorUtilities.offButtonColor
                                              .withOpacity(0.1),
                                        ],
                                      ),
                                      border: 0,
                                      blur: 3,
                                      child: Center(
                                        child: Icon(
                                          Icons.close,
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(15),
            child: customButton(
              onTap: () {
                if (controller.about.isEmpty ||
                    controller.album.isEmpty ||
                    controller.dateController.text.isEmpty ||
                    controller.imagePath == null) {
                } else {
                  Get.to(EditEventDetailView());
                }
              },
              isDisable: controller.about.isEmpty ||
                  controller.album.isEmpty ||
                  controller.dateController.text.isEmpty ||
                  controller.imagePath == null
                  ? true
                  : false,
              title: "Continue",
            ),
          ),
        );
      },
    );
  }
}
