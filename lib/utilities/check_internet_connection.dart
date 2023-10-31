import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

import 'font_utilities.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    super.onInit();
  }

  void updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.bottomSheet(
        Container(
          color: ColorUtilities.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/img/wifi.png",
                  scale: 4,
                ),
              ),
              SizedBox(
                height: Get.width * 0.1,
              ),
              Text(
                "Your network seems to be down !",
                textAlign: TextAlign.center,
                style: FontUtilities.h14(
                  color: ColorUtilities.goldenColor,
                  fontFamily: "InterRegular",
                ),
              ),
              SizedBox(
                height: Get.width * 0.02,
              ),
              Text(
                "Please check your internet connections",
                textAlign: TextAlign.center,
                style: FontUtilities.h16(
                  color: ColorUtilities.white,
                  fontFamily: "InterRegular",
                ),
              ),
            ],
          ),
        ),
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
      );
    } else {
      if (Get.isBottomSheetOpen == true) {
        Get.back();
      }
    }
  }
}

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
