import 'package:get/get.dart';

import '../controllers/lounchtimeadd_controller.dart';

class LounchtimeaddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LounchtimeaddController>(
      () => LounchtimeaddController(),
    );
  }
}
