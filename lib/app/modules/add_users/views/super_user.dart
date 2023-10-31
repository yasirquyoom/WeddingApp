import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utilities/color_utilities.dart';
import '../../../../utilities/font_utilities.dart';
import '../../../../utilities/widget/custom_button.dart';
import '../controllers/add_users_controller.dart';

class SuperUserView extends GetView<AddUsersController> {
  SuperUserView({Key? key}) : super(key: key);
  AddUsersController addUsersController = Get.put(AddUsersController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUsersController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorUtilities.offButtonColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      "Select role and add new members to manage this event",
                      style: FontUtilities.h16(
                        color: ColorUtilities.white,
                        fontFamily: FontFamily.semiBoldInter,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.album.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text(
                                controller.album[index],
                                style: FontUtilities.h16(
                                  color: ColorUtilities.offWhite,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  controller.selectRole =
                                      controller.album[index];
                                },
                                child: Container(
                                  height: Get.width * 0.08,
                                  width: Get.width * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: ColorUtilities.goldenColor,
                                    ),
                                  ),
                                  child: controller.album[index] ==
                                          controller.selectRole
                                      ? Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: CircleAvatar(
                                            radius: 15,
                                            backgroundColor:
                                                ColorUtilities.goldenColor,
                                          ),
                                        )
                                      : SizedBox(),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.emailId = value;
                      },
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                            EdgeInsets.only(left: 20, top: 30, right: 20),
                        hintText: "Enter email id",
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: ColorUtilities.offWhite,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorUtilities.offButtonColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorUtilities.offButtonColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.width * 0.04,
                    ),
                    customButton(
                      onTap:() {
                        if(controller.emailId.isEmpty){

                        } else{

                        }
                      },
                      isDisable: controller.emailId.isEmpty ? true : false,
                      title: "Invite",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.width * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
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
            ),
          ],
        ),
      );
    });
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
