import 'package:get/get.dart';

import '../controllers/edit_crate_event_controller.dart';

class EditCrateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditCrateEventController>(
      () => EditCrateEventController(),
    );
  }
}
