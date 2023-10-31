import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_app/app/modules/signUp/model/profile_picture_res_model.dart';
import '../../../../utilities/color_utilities.dart';
import '../../../../utilities/veriable_utilites.dart';
import '../../../services/api_service.dart';
import '../../../services/base_service.dart';
import '../model/signup_res_model.dart';
import '../views/select_profile_picture_view.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController datOfBirthController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  String _firstName = '';

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
    update();
  }

  String _userName = '';

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    update();
  }

  String _lastName = '';

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
    update();
  }

  bool _date = false;

  bool get date => _date;

  set date(bool value) {
    _date = value;
    update();
  }

  List<String> city = [
    "Banglore",
    "Ahmedabad",
    "Surat",
    "Delhi",
  ];

  String _isSelected = '';

  String get isSelected => _isSelected;

  set isSelected(String value) {
    _isSelected = value;
    update();
  }

  bool _isDropDownOpen = false;

  bool get isDropDownOpen => _isDropDownOpen;

  set isDropDownOpen(bool value) {
    _isDropDownOpen = value;
    update();
  } // String? dropdownValue;
  //
  // void dropDownSelect(String? value) {
  //   dropdownValue = value;
  //   update();
  // }

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

  CreateProfileResModel? _createProfileResModel;

  CreateProfileResModel? get createProfileResModel => _createProfileResModel;

  set createProfileResModel(CreateProfileResModel? value) {
    _createProfileResModel = value;
    update();
  }

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    update();
  }

  Future setUpProfile({
    required String phoneNumber,
    required String userName,
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String city,
  }) async {
    Map<String, dynamic> reqBody = {
      "username": userName,
      "firstName": firstName,
      "lastName": lastName,
      "dateOfBirth": dateOfBirth,
      "phoneNumber": phoneNumber,
      "city": city,
    };

    String basicAuth = 'Basic ' + base64.encode(utf8.encode('IFE:IFEbe@18'));

    try {
      loading = true;
      String? data = await API.callAPI(
        url: ApiUtilities.createProfile,
        type: APIType.tPost,
        body: reqBody,
        header: {
          'authorization': basicAuth,
        },
      );

      if (data != null) {
        createProfileResModel = createProfileResModelFromJson(data);
        VariableUtilities.storage
            .write(KeyUtilities.isProfileLogIn, phoneNumber);
        Get.showSnackbar(
          GetSnackBar(
            message: createProfileResModel?.body,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorUtilities.goldenColor,
            duration: const Duration(seconds: 2),
          ),
        );
        Get.to(SelectProfilePictureView());
      }
      loading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      loading = false;
      Get.showSnackbar(
        GetSnackBar(
          message: createProfileResModel?.body,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorUtilities.red,
          duration: const Duration(seconds: 2),
        ),
      );
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
  }) async {
    try {
      pictureLoading = true;
      Map<String, dynamic> data = await API.callDioAPI(
        url:
            "${ApiUtilities.createProfilePicture}/9033337001",
        file: file,
      );

      if (data != null) {
        profilePictureResModel = ProfilePictureResModel.fromJson(data);
        VariableUtilities.storage.write(KeyUtilities.isUploadPicture, true);
        Get.showSnackbar(
          GetSnackBar(
            message: profilePictureResModel?.body,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorUtilities.goldenColor,
            duration: const Duration(seconds: 2),
          ),
        );
        Get.offAllNamed("/login");
      }
      pictureLoading = false;
      log("sendOtpResModel===API===>>>>>>$data");
    } catch (e) {
      pictureLoading = false;
      print("sendOtpResModel===ERROR===>>>${e}");
    }
  }
}
