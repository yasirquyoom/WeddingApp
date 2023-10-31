import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import '../controllers/add_users_controller.dart';

class UserView extends GetView<AddUsersController> {
  UserView({Key? key}) : super(key: key);
  AddUsersController addUsersController = Get.put(AddUsersController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Yasir Quyoom",
                    style: FontUtilities.h16(
                      color: ColorUtilities.white,
                      fontFamily: FontFamily.semiBoldInter,
                    ),
                  ),
                  subtitle: Text(
                    "user@example.com",
                    style: FontUtilities.h16(
                      color: ColorUtilities.offWhite,
                      fontFamily: FontFamily.regularInter,
                    ),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: ColorUtilities.white,
                    radius: Get.width * 0.1,
                    child: Image.asset(
                      "assets/img/profile_picture.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  buildDialog();
                },
                child: Container(
                  height: Get.width * 0.12,
                  width: Get.width * 0.23,
                  decoration: BoxDecoration(
                    color: ColorUtilities.offButtonColor,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      "Remove",
                      style: FontUtilities.h14(
                        color: ColorUtilities.offWhite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  buildDialog() {
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Container(
          height: Get.width * 0.72,
          width: Get.width * 0.74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorUtilities.offButtonColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Are you sure you want remove ?",
                  textAlign: TextAlign.center,
                  style: FontUtilities.h20(
                    color: ColorUtilities.white,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: ColorUtilities.white,
                  radius: Get.width * 0.07,
                  child: Image.asset(
                    "assets/img/profile_picture.png",
                    fit: BoxFit.fill,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Yasir Quyoom ( Admin )\n",
                      style: FontUtilities.h18(
                        color: ColorUtilities.white,
                        fontFamily: FontFamily.semiBoldInter,
                      ),
                      children: [
                        TextSpan(
                          text: "user@example.com",
                          style: FontUtilities.h18(
                            color: ColorUtilities.offWhite,
                            fontFamily: FontFamily.mediumInter,
                          ),
                        ),
                      ]),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: Get.width * 0.12,
                          decoration: BoxDecoration(
                            color: ColorUtilities.blackColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: FontUtilities.h16(
                                color: ColorUtilities.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: Get.width * 0.12,
                          decoration: BoxDecoration(
                            color: ColorUtilities.goldenColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: FontUtilities.h16(
                                color: ColorUtilities.blackColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
