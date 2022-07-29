import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/showlounchtime_controller.dart';

class ShowlounchtimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
