import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/otp_verify/views/otp_verify_view.dart';
import 'package:wedding_app/utilities/color_utilities.dart';

import '../../../services/api_service.dart';
import '../../../services/base_service.dart';
import '../models/send_otp_res_model.dart';

class PhoneLogInController extends GetxController {
  //TODO: Implement PhoneLogInController
  TextEditingController mobileNumberController = TextEditingController();

  String _number = '';

  String get number => _number;

  set number(String value) {
    _number = value;
    update();
  }

  bool _numberLength = false;

  bool get numberLength => _numberLength;

  set numberLength(bool value) {
    _numberLength = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  SendOtpResModel? _sendOtpResModel;

  SendOtpResModel? get sendOtpResModel => _sendOtpResModel;

  set sendOtpResModel(SendOtpResModel? value) {
    _sendOtpResModel = value;
    update();
  }

  bool _sendOtpLoading = false;

  bool get sendOtpLoading => _sendOtpLoading;

  set sendOtpLoading(bool value) {
    _sendOtpLoading = value;
    update();
  }

  Future sendOtp({required String phoneNumber}) async {
    Map<String, dynamic> reqBody = {
      "phoneNumber": "+91${phoneNumber}",
    };

    try {
      sendOtpLoading = true;
      String? data = await API.callAPI(
        url: ApiUtilities.sendOtp,
        type: APIType.tPost,
        body: reqBody,
      );

      if (data != null) {
        sendOtpResModel = sendOtpResModelFromJson(data);
        Get.showSnackbar(
          GetSnackBar(
            message: sendOtpResModel?.body,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorUtilities.goldenColor,
            duration: const Duration(seconds: 2),
          ),
        );
        Get.toNamed(
          "/otp-verify",
          arguments: MobileNumber(number: mobileNumberController.text),
        );
      }
      sendOtpLoading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      sendOtpLoading = false;
      Get.showSnackbar(
        GetSnackBar(
          message: sendOtpResModel?.body,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorUtilities.red,
          duration: const Duration(seconds: 2),
        ),
      );
      print("sendOtpResModel===ERROR===>>>${e}");
    }
  }
}
