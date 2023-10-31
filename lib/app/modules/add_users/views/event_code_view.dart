import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/add_users/controllers/add_users_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class EventCodeView extends GetView<AddUsersController> {
  EventCodeView({Key? key}) : super(key: key);
  AddUsersController addUsersController = Get.put(AddUsersController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: Get.width * 0.05,
          ),
          Text(
            "Share QR code or event code to add new members in the event",
            textAlign: TextAlign.center,
            style: FontUtilities.h20(
              color: ColorUtilities.white,
            ),
          ),
          Container(
            height: Get.width * 0.65,
            width: Get.width * 0.65,
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorUtilities.white,
            ),
          ),
          Text(
            "or",
            textAlign: TextAlign.center,
            style: FontUtilities.h24(
              color: ColorUtilities.white,
            ),
          ),
          SizedBox(
            height: Get.width * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 46,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: ColorUtilities.offButtonColor,
              ),
              child: Center(
                child: Text(
                  "IFE/4584fr34dgh5",
                  style: FontUtilities.h16(
                    fontFamily: FontFamily.regularInter,
                    color: ColorUtilities.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.width * 0.07,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: Get.width * 0.12,
                  decoration: BoxDecoration(
                    color: ColorUtilities.offButtonColor,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Image",
                        style: FontUtilities.h16(
                          color: ColorUtilities.white,
                        ),
                      ),
                      Image.asset(
                        "assets/img/arrow_down _square.png",
                        scale: 4,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: Get.width * 0.07,
              ),
              Expanded(
                child: Container(
                  height: Get.width * 0.12,
                  decoration: BoxDecoration(
                    color: ColorUtilities.goldenColor,
                    borderRadius: BorderRadius.circular(23),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Share",
                        style: FontUtilities.h16(
                          color: ColorUtilities.blackColor,
                        ),
                      ),
                      Image.asset(
                        "assets/img/share.png",
                        scale: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
