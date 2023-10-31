import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/otp_verify/model/otp_verify_res_model.dart';
import 'package:wedding_app/app/modules/otp_verify/views/otp_verify_view.dart';
import 'package:wedding_app/utilities/veriable_utilites.dart';
import '../../../../utilities/color_utilities.dart';
import '../../../services/api_service.dart';
import '../../../services/base_service.dart';

class OtpVerifyController extends GetxController {
  //TODO: Implement OtpVerifyController

  MobileNumber argument = Get.arguments as MobileNumber;

  final count = 0.obs;

  List<TextEditingController> otpControllers =
      List<TextEditingController>.generate(6, (i) => TextEditingController());

  final focusNodes = List<FocusNode>.generate(6, (i) => FocusNode());
  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  bool _otpConfirm = false;

  bool get otpConfirm => _otpConfirm;

  set otpConfirm(bool value) {
    _otpConfirm = value;
    update();
  }

  VerifyOtpResModel? _verifyOtpResModel;

  VerifyOtpResModel? get verifyOtpResModel => _verifyOtpResModel;

  set verifyOtpResModel(VerifyOtpResModel? value) {
    _verifyOtpResModel = value;
    update();
  }

  bool _verifyOtpLoading = false;

  bool get verifyOtpLoading => _verifyOtpLoading;

  set verifyOtpLoading(bool value) {
    _verifyOtpLoading = value;
    update();
  }

  bool _isInvalidOtp = false;

  bool get isInvalidOtp => _isInvalidOtp;

  set isInvalidOtp(bool value) {
    _isInvalidOtp = value;
    update();
  }

  Future verifyOtp(
      {required String phoneNumber, required String otpNumber}) async {
    Map<String, dynamic> reqBody = {
      "phoneNumber": "+91${phoneNumber}",
      "otp": otpNumber,
    };

    try {
      verifyOtpLoading = true;
      String? data = await API.callAPI(
        url: ApiUtilities.verifyOtp,
        type: APIType.tPost,
        body: reqBody,
      );

      if (data != null) {
        verifyOtpResModel = verifyOtpResModelFromJson(data);
        VariableUtilities.storage.write(KeyUtilities.isMobileLogIn, argument.number);
        if (verifyOtpResModel?.body != null) {
          isInvalidOtp = false;
          VariableUtilities.storage.write(KeyUtilities.isUserId, verifyOtpResModel?.body?.id);
          Get.showSnackbar(
            GetSnackBar(
              message: verifyOtpResModel?.status,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: ColorUtilities.goldenColor,
              duration: const Duration(seconds: 2),
            ),
          );
          Get.toNamed('/bottom-bar');
        } else {
          if (verifyOtpResModel?.error == null) {
            Get.showSnackbar(
              GetSnackBar(
                message: verifyOtpResModel?.status,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: ColorUtilities.goldenColor,
                duration: const Duration(seconds: 2),
              ),
            );
            Get.toNamed('/sign-up');
          } else {
            isInvalidOtp = true;
          }
        }
      }
      verifyOtpLoading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      verifyOtpLoading = false;
      print("sendOtpResModel===ERROR===>>>${e}");
    }
  }
}
