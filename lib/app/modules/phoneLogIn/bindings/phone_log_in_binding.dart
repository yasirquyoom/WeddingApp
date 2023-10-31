import 'package:get/get.dart';

import '../controllers/phone_log_in_controller.dart';

class PhoneLogInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneLogInController>(
      () => PhoneLogInController(),
    );
  }
}
