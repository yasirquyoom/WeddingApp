import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/signUp/views/date_picker/date_picker_widget.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';
import 'package:wedding_app/utilities/veriable_utilites.dart';
import 'package:wedding_app/utilities/widget/custom_app_bar.dart';
import 'package:wedding_app/utilities/widget/custom_button.dart';
import 'package:wedding_app/utilities/widget/custom_textfield.dart';
import '../../../../utilities/widget/circular_progress.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  SignUpView({Key? key}) : super(key: key);
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: ColorUtilities.backgroundColor,
              appBar: customAppBar(
                title: "Personal Information",
              ),
              bottomNavigationBar: GetBuilder<SignUpController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: customButton(
                      onTap: () async {
                        if (controller.isSelected.isEmpty ||
                            controller.firstName.isEmpty ||
                            controller.userName.isEmpty ||
                            controller.lastName.isEmpty ||
                            controller.datOfBirthController.text.isEmpty) {
                        } else {
                          await controller.setUpProfile(
                            phoneNumber: VariableUtilities.storage
                                .read(KeyUtilities.isMobileLogIn),
                            userName: controller.userNameController.text,
                            firstName: controller.firstNameController.text,
                            lastName: controller.lastNameController.text,
                            dateOfBirth: controller.datOfBirthController.text,
                            city: controller.isSelected,
                          );
                        }
                      },
                      isDisable: controller.isSelected.isEmpty ||
                              controller.firstName.isEmpty ||
                              controller.userName.isEmpty ||
                              controller.lastName.isEmpty ||
                              controller.datOfBirthController.text.isEmpty
                          ? true
                          : false,
                      title: "Continue",
                    ),
                  );
                },
              ),
              body: GetBuilder<SignUpController>(
                builder: (controller) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "User Name",
                              style: FontUtilities.h14(
                                fontFamily: FontFamily.mediumInter,
                                color: ColorUtilities.white,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            CustomTextField(
                              hintText: 'Enter your User name',
                              textEditingController:
                                  controller.userNameController,
                              autoFocus: true,
                              onChange: (text) {
                                controller.userName = text;
                              },
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            Text(
                              "First Name",
                              style: FontUtilities.h14(
                                fontFamily: FontFamily.mediumInter,
                                color: ColorUtilities.white,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            CustomTextField(
                              hintText: 'Enter your first name',
                              textEditingController:
                                  controller.firstNameController,
                              autoFocus: true,
                              onChange: (text) {
                                controller.firstName = text;
                              },
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            Text(
                              "Last Name",
                              style: FontUtilities.h14(
                                fontFamily: FontFamily.mediumInter,
                                color: ColorUtilities.white,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            CustomTextField(
                              hintText: 'Enter your last name',
                              textEditingController:
                                  controller.lastNameController,
                              onChange: (text) {
                                controller.lastName = text;
                              },
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            Text(
                              "Date of Birth",
                              style: FontUtilities.h14(
                                fontFamily: FontFamily.mediumInter,
                                color: ColorUtilities.white,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            CustomTextField(
                              hintText: 'Select your Date of birth',
                              readOnly: true,
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                DateTime? datePicked =
                                    await DatePicker.showSimpleDatePicker(
                                  context,
                                  backgroundColor:
                                      Color(0xff000144).withOpacity(0.4),
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
                                controller.datOfBirthController.text =
                                    datePicked.toString().substring(0, 10);
                                controller.date = !controller.date;
                              },
                              textEditingController:
                                  controller.datOfBirthController,
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            Text(
                              "Select City",
                              style: FontUtilities.h14(
                                fontFamily: FontFamily.mediumInter,
                                color: ColorUtilities.white,
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.03,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.isDropDownOpen == false) {
                                  controller.isDropDownOpen = true;
                                }
                              },
                              child: Container(
                                height: controller.isDropDownOpen == true
                                    ? Get.width * 0.6
                                    : Get.width * 0.14,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: ColorUtilities.offButtonColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(23),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.02),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              controller.isSelected == ""
                                                  ? Text(
                                                      'Select your city',
                                                      style: FontUtilities.h16(
                                                        color: ColorUtilities
                                                            .offWhite,
                                                      ),
                                                    )
                                                  : Text(
                                                      controller.isSelected,
                                                      style: FontUtilities.h16(
                                                        color: ColorUtilities
                                                            .white,
                                                      ),
                                                    ),
                                              controller.isDropDownOpen == true
                                                  ? Image.asset(
                                                      "assets/img/up_arrow.png",
                                                      scale: 4.5,
                                                      color: ColorUtilities
                                                          .goldenColor,
                                                    )
                                                  : Image.asset(
                                                      "assets/img/down_arrow.png",
                                                      scale: 4.5,
                                                    ),
                                            ],
                                          ),
                                        ),
                                        controller.isDropDownOpen == true
                                            ? SizedBox(
                                                height: Get.height * 0.02,
                                              )
                                            : SizedBox(),
                                        controller.isDropDownOpen == true
                                            ? Expanded(
                                                child: ListView.builder(
                                                  itemCount:
                                                      controller.city.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller.isSelected =
                                                            controller
                                                                .city[index];
                                                        controller
                                                                .isDropDownOpen =
                                                            false;
                                                      },
                                                      child: Container(
                                                        color: controller
                                                                    .isSelected ==
                                                                controller
                                                                    .city[index]
                                                            ? ColorUtilities
                                                                .goldenColor
                                                            : Colors
                                                                .transparent,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 10),
                                                          child: Text(
                                                            "${controller.city[index]}",
                                                            style: FontUtilities
                                                                .h16(
                                                              color: controller
                                                                          .isSelected ==
                                                                      controller
                                                                              .city[index]
                                                                  ? ColorUtilities
                                                                      .offButtonColor
                                                                  : ColorUtilities
                                                                      .offGray,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.width * 0.07,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            controller.loading == true
                ? circularProgressIndicator()
                : SizedBox(),
          ],
        );
      },
    );
  }
}
