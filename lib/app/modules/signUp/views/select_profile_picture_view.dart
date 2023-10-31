import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/signUp/controllers/sign_up_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';

import '../../../../utilities/widget/circular_progress.dart';

class SelectProfilePictureView extends GetView<SignUpController> {
  SelectProfilePictureView({Key? key}) : super(key: key);
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (controller) {
      return Stack(
        children: [
          Scaffold(
            backgroundColor: ColorUtilities.backgroundColor,
            appBar: customAppBar(title: "Setup your profile"),
            body: Column(
              children: [
                Spacer(),
                controller.imagePath?.isEmpty == false
                    ? Stack(
                        children: [
                          CircleAvatar(
                            radius: Get.width * 0.12,
                            backgroundColor: ColorUtilities.white,
                            backgroundImage: FileImage(
                              File(controller.imagePath!),
                            ),
                          ),
                          Positioned(
                            top: Get.width * 0.16,
                            left: Get.width * 0.16,
                            child: Transform.rotate(
                              angle: -pi / 4,
                              child: GestureDetector(
                                onTap: () {
                                  controller.imagePath = null;
                                },
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: ColorUtilities.goldenColor,
                                  child: Icon(Icons.add,
                                      color: ColorUtilities.offButtonColor,
                                      size: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Stack(
                        children: [
                          CircleAvatar(
                            radius: Get.width * 0.12,
                            backgroundColor: ColorUtilities.white,
                            child: Image.asset("assets/img/profile_picture.png",
                                width: Get.width * 0.11,
                                height: Get.width * 0.14,
                                fit: BoxFit.fill),
                          ),
                          Positioned(
                            top: Get.width * 0.16,
                            left: Get.width * 0.16,
                            child: GestureDetector(
                              onTap: () {
                                controller.getImage();
                              },
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: ColorUtilities.goldenColor,
                                child: Icon(Icons.add,
                                    color: ColorUtilities.offButtonColor,
                                    size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: customButton(
                      onTap: () async {
                        await controller.setUpProfilePicture(
                          file: [
                            File(controller.imagePath ?? ""),
                          ],
                        );
                      },
                      isDisable: (controller.imagePath?.isEmpty ?? true)
                          ? true
                          : false,
                      title: "Continue"),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
          controller.pictureLoading == true
              ? circularProgressIndicator()
              : SizedBox(),
        ],
      );
    });
  }
}
