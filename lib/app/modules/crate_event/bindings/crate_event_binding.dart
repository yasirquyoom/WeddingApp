import 'package:get/get.dart';

import '../controllers/crate_event_controller.dart';

class CrateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrateEventController>(
      () => CrateEventController(),
    );
  }
}
