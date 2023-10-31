import 'package:get/get.dart';

import '../controllers/ai_view_controller.dart';

class AiViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiViewController>(
      () => AiViewController(),
    );
  }
}
