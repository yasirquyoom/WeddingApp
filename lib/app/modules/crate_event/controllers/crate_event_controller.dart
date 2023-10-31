import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_app/utilities/veriable_utilites.dart';

import '../../../../utilities/color_utilities.dart';
import '../../../services/api_service.dart';
import '../../../services/base_service.dart';
import '../../signUp/model/profile_picture_res_model.dart';
import '../model/create_event_res_model.dart';
import '../views/payment_page.dart';

class CrateEventController extends GetxController {
  //TODO: Implement CrateEventController

  TextEditingController albumNameController = TextEditingController();
  TextEditingController aboutEventController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  ///Event Detail
  TextEditingController managementStudioController = TextEditingController();
  TextEditingController manageWebsiteController = TextEditingController();
  TextEditingController mangeInstagramController = TextEditingController();
  TextEditingController mangeMobileNumberController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController venueWebsiteController = TextEditingController();
  TextEditingController venueInstagramController = TextEditingController();
  TextEditingController venueNumberController = TextEditingController();
  TextEditingController photographController = TextEditingController();
  TextEditingController photographInstagramController = TextEditingController();
  TextEditingController photographMobileNumberController =
      TextEditingController();
  TextEditingController makeUpController = TextEditingController();
  TextEditingController makeUpInstagramController = TextEditingController();
  TextEditingController makeUpMobileNumberController = TextEditingController();

  CreateEventResModel? _createEventResModel;

  CreateEventResModel? get createEventResModel => _createEventResModel;

  set createEventResModel(CreateEventResModel? value) {
    _createEventResModel = value;
    update();
  }

  bool _isCreateLoading = false;

  bool get isCreateLoading => _isCreateLoading;

  set isCreateLoading(bool value) {
    _isCreateLoading = value;
    update();
  }

  Future createEvent({
    required String name,
    required String description,
    required String date,
    required String image,
    required List vendors,
  }) async {
    Map<String, dynamic> reqBody = {
      "name": name,
      "description": description,
      "date": date,
      "hostId": VariableUtilities.storage.read(KeyUtilities.isUserId),
      "faceRecognitionPrivacy": false,
      "enableGuestUploads": false,
      "vendors": vendors,
    };
    try {
      isCreateLoading = true;
      String? data = await API.callAPI(
        url: ApiUtilities.eventCreate,
        type: APIType.tPost,
        body: reqBody,
      );

      if (data != null) {
        createEventResModel = createEventResModelFromJson(data);
        await setUpProfilePicture(file: [File(image)], createId: createEventResModel?.body?.id ?? "");
      }
      isCreateLoading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      isCreateLoading = false;
      print("sendOtpResModel===ERROR===>>>${e}");
    }
  }

  ProfilePictureResModel? _profilePictureResModel;

  ProfilePictureResModel? get profilePictureResModel => _profilePictureResModel;

  set profilePictureResModel(ProfilePictureResModel? value) {
    _profilePictureResModel = value;
    update();
  }

  bool _pictureLoading = false;

  bool get pictureLoading => _pictureLoading;

  set pictureLoading(bool value) {
    _pictureLoading = value;
    update();
  }

  Future setUpProfilePicture({
    required List<File> file,
    required String createId,
  }) async {
    try {
      pictureLoading = true;
      Map<String, dynamic> data = await API.callDioAPI(
        url: "${ApiUtilities.uploadPhoto}$createId",
        file: file,
      );

      if (data != null) {
        profilePictureResModel = ProfilePictureResModel.fromJson(data);
        Get.showSnackbar(
          GetSnackBar(
            message: profilePictureResModel?.body,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorUtilities.goldenColor,
            duration: const Duration(seconds: 2),
          ),
        );
        Get.to(PaymentPageView());
      }
      pictureLoading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      pictureLoading = false;
      Get.showSnackbar(
        GetSnackBar(
          message: profilePictureResModel?.body,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorUtilities.red,
          duration: const Duration(seconds: 2),
        ),
      );
      print("sendOtpResModel===ERROR===>>>${e}");
    }
  }

  int _selectStorage = 0;

  int get selectStorage => _selectStorage;

  set selectStorage(int value) {
    _selectStorage = value;
    update();
  }

  String _album = "";

  String get album => _album;

  set album(String value) {
    _album = value;
    update();
  }

  List wedding = [
    {
      "title": "Simple",
      "storage": "1000",
      "price": "₹10000",
    },
    {
      "title": "Golden",
      "storage": "2000",
      "price": "₹15000",
    },
    {
      "title": "Diamond",
      "storage": "3000",
      "price": "₹20000",
    },
  ];

  String _about = '';

  String get about => _about;

  set about(String value) {
    _about = value;
    update();
  }

  String? _imagePath;

  String? get imagePath => _imagePath;

  set imagePath(String? value) {
    _imagePath = value;
    update();
  }

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath = image?.path;
    update();
  }

  bool _date = false;

  bool get date => _date;

  set date(bool value) {
    _date = value;
    update();
  }

  List<List<TextEditingController>> _vendorList = [];

  List<List<TextEditingController>> get vendorList => _vendorList;

  set vendorList(List<List<TextEditingController>> value) {
    _vendorList = value;
    update();
  }

  void addVendorData() {
    vendorList.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    update();
  }

  void removeVendorData(int index) {
    vendorList.removeAt(index);
    update();
  }
}
