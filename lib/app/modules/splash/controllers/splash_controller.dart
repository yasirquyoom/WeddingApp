import 'dart:async';

import 'package:get/get.dart';

import '../../../../utilities/veriable_utilites.dart';
import '../../signUp/views/select_profile_picture_view.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    start();
  }

  void start() {
    _timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) {

        VariableUtilities.storage.read(KeyUtilities.isUserId) == null
            ? VariableUtilities.storage.read(KeyUtilities.isMobileLogIn) == null
                ? Get.offNamed("/login")
                : VariableUtilities.storage.read(KeyUtilities.isProfileLogIn) ==
                        null
                    ? Get.toNamed('/sign-up')
                    : VariableUtilities.storage.read(KeyUtilities.isUploadPicture) ==
                            null
                        ? Get.to(() => SelectProfilePictureView())
                        : Get.offNamed("/login")
            : Get.offNamed("bottom-bar");
        // Get.offNamed("/videos");
        // Get.to(SelectProfilePictureView());
        _timer.cancel();
      },
    );
  }
}
