import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/app/modules/settings/model/setting_data_model.dart';
import 'package:wedding_app/utilities/asset_icons.dart';

class SettingsController extends GetxController {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController newNumberController = TextEditingController();

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

  String _newNumber = '';

  String get newNumber => _newNumber;

  set newNumber(String value) {
    _newNumber = value;
    update();
  }

  bool _newNumberLength = false;

  bool get newNumberLength => _newNumberLength;

  set newNumberLength(bool value) {
    _newNumberLength = value;
    update();
  }

  List<SettingDataModel> settingData = [
    SettingDataModel(
        imagePath: AssetIcons.updatePhone, name: "Update phone number"),
    SettingDataModel(
        imagePath: AssetIcons.privacyPolicy, name: "Privacy policy"),
    SettingDataModel(
        imagePath: AssetIcons.reportProblem, name: "Report a problem"),
    SettingDataModel(imagePath: AssetIcons.rateMyApp, name: "Rate my app"),
    SettingDataModel(imagePath: AssetIcons.shareApp, name: "Share with friend"),
    SettingDataModel(imagePath: AssetIcons.logOut, name: "Log out"),
  ];
}
