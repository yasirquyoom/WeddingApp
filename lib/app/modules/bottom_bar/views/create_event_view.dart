import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:wedding_app/utilities/color_utilities.dart';
import 'package:wedding_app/utilities/font_utilities.dart';

class CreateEventView extends GetView<BottomBarController> {
  const CreateEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtilities.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorUtilities.backgroundColor,
        centerTitle: false,
        title: Text(
          "Create Event",
          style: FontUtilities.h24(
              color: Colors.white, fontFamily: FontFamily.semiBoldInter),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "Scan QR code to join the\nevents",
            textAlign: TextAlign.center,
            style: FontUtilities.h20(
                color: ColorUtilities.white,
                fontFamily: FontFamily.regularInter),
          ),
          Container(
            height: Get.width * 0.65,
            width: Get.width * 0.65,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: ColorUtilities.goldenColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "or",
              textAlign: TextAlign.center,
              style: FontUtilities.h24(
                  color: ColorUtilities.white,
                  fontFamily: FontFamily.semiBoldInter),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 46,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: ColorUtilities.offButtonColor),
              child: Center(
                child: Text(
                  // "Continue",
                  "Enter  code to join the event",
                  style: FontUtilities.h18(
                      color: ColorUtilities.offWhite,
                      fontFamily: FontFamily.regularInter),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed("/crate-event");
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              height: 46,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  color: ColorUtilities.goldenColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create a new event",
                    style: FontUtilities.h18(
                        color: ColorUtilities.offButtonColor,
                        fontFamily: FontFamily.regularInter),
                  ),
                  SizedBox(
                    width: Get.width * 0.12,
                  ),
                  const Icon(
                    Icons.add,
                    color: ColorUtilities.offButtonColor,
                    size: 25,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _buildQrView(BuildContext context, Key qrKey,
  //     Function(QRViewController) onQRViewCreated) {
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: onQRViewCreated,
  //     overlay: QrScannerOverlayShape(
  //       cutOutBottomOffset: 1.2,
  //       overlayColor: Colors.black.withOpacity(0.7),
  //       borderRadius: 16,
  //       borderLength: 24,
  //       borderWidth: 8,
  //       cutOutSize: 270,
  //     ),
  //   );
  // }
}
