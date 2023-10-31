import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCrateEventController extends GetxController {
  //TODO: Implement EditCrateEventController

  TextEditingController albumNameController = TextEditingController();
  TextEditingController aboutEventController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController referralCodeController = TextEditingController();

  ///Event Detail
  TextEditingController managementStudioController = TextEditingController();
  TextEditingController manageWebsiteController = TextEditingController();
  TextEditingController mangeInstagramController = TextEditingController();
  TextEditingController venueController = TextEditingController();
  TextEditingController venueWebsiteController = TextEditingController();
  TextEditingController venueInstagramController = TextEditingController();
  TextEditingController photographController = TextEditingController();
  TextEditingController photographInstagramController = TextEditingController();
  TextEditingController makeUpController = TextEditingController();
  TextEditingController makeUpInstagramController = TextEditingController();

  bool _isSwitchButton =false;

  bool get isSwitchButton => _isSwitchButton;

  set isSwitchButton(bool value) {
    _isSwitchButton = value;
    update();
  }

  bool _isGuestButton = false;

  bool get isGuestButton => _isGuestButton;

  set isGuestButton(bool value) {
    _isGuestButton = value;
    update();
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
      "title": "Silver",
      "storage": "100",
      "price": "₹5000",
    },
    {
      "title": "Add on",
      "storage": "50",
      "price": "₹5000",
    },
    {
      "title": "Add on",
      "storage": "250",
      "price": "₹5000",
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
      TextEditingController()
    ]);
    update();
  }

  void removeVendorData(int index) {
    vendorList.removeAt(index);
    update();
  }

  final count = 0.obs;
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

  void increment() => count.value++;
}
