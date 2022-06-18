import 'package:get/get.dart';

import '../controllers/timelist_controller.dart';

class TimelistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimelistController>(
      () => TimelistController(),
    );
  }
}
